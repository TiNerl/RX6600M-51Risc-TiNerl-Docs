#!/bin/bash
# Acorda a GPU do suspend
echo "on" > /sys/bus/pci/devices/0000:03:00.0/power/control
sleep 5

# Modo manual (permite alteração dos valores a seguir)
echo manual > /sys/class/drm/card0/device/power_dpm_force_performance_level

# SCLK: mínimo 500MHz, máximo 2300MHz (padrao esperado deveeria ser 2450, reduzido por estabilidade)
echo "s 0 500" > /sys/class/drm/card0/device/pp_od_clk_voltage
echo "s 1 2300" > /sys/class/drm/card0/device/pp_od_clk_voltage

# MCLK: 1750MHz conforme .mpt
echo "m 1 1750" > /sys/class/drm/card0/device/pp_od_clk_voltage

# Aplica as configurações
echo "c" > /sys/class/drm/card0/device/pp_od_clk_voltage

# Força nível máximo
echo "1" > /sys/class/drm/card0/device/pp_dpm_sclk

# Mantém GPU acordada
echo "on" > /sys/bus/pci/devices/0000:03:00.0/power/control
