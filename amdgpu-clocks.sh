#!/bin/bash
# Otimização de Clocks AMDGPU para LLMs - TN02 Server

# 1. Boa Prática: Garantir que o script seja executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Erro: Este script precisa ser executado como root (use sudo)."
  exit 1
fi

# 2. Varredura Dinâmica Segura: Encontra o dispositivo carregado com o driver 'amdgpu'
DEVICE_DIR=$(grep -l "amdgpu" /sys/class/drm/card*/device/uevent 2>/dev/null | sed 's|/uevent||' | head -n 1)

if [ -z "$DEVICE_DIR" ]; then
    echo "Erro: Nenhuma GPU AMD encontrada no sistema."
    exit 1
fi

echo "GPU AMD localizada dinamicamente em: $DEVICE_DIR"

# 3. Preparação: Acorda a GPU e força o modo manual
echo "on" > "$DEVICE_DIR/power/control"
sleep 2
echo "manual" > "$DEVICE_DIR/power_dpm_force_performance_level"

# 4. Aplicação de Clocks (.mpt base)
echo "s 0 500" > "$DEVICE_DIR/pp_od_clk_voltage"
echo "s 1 2300" > "$DEVICE_DIR/pp_od_clk_voltage"
echo "m 1 875" > "$DEVICE_DIR/pp_od_clk_voltage"

# Efetiva as alterações no firmware (Commit)
echo "c" > "$DEVICE_DIR/pp_od_clk_voltage"

# 5. Força o estado DPM mais alto
echo "1" > "$DEVICE_DIR/pp_dpm_sclk"

# 6. Otimização Extra: Ativa o perfil Compute se disponível no driver
if grep -q "COMPUTE" "$DEVICE_DIR/pp_power_profile_mode"; then
    COMPUTE_INDEX=$(grep "COMPUTE" "$DEVICE_DIR/pp_power_profile_mode" | awk '{print $1}')
    echo "$COMPUTE_INDEX" > "$DEVICE_DIR/pp_power_profile_mode"
    echo "Perfil COMPUTE ativado."
fi

echo "Clocks e estado de performance aplicados com sucesso para o Ollama!"
