#!/bin/bash
# Acorda a GPU do suspend
echo "on" | sudo tee /sys/bus/pci/devices/0000:03:00.0/power/control > /dev/null
sleep 5

# Modo manual (permite alteração dos valores a seguir)
echo "manual" | sudo tee /sys/class/drm/card1/device/power_dpm_force_performance_level > /dev/null

# SCLK: mínimo 500MHz, máximo 2300MHz
echo "s 0 500" | sudo tee /sys/class/drm/card1/device/pp_od_clk_voltage > /dev/null
echo "s 1 2300" | sudo tee /sys/class/drm/card1/device/pp_od_clk_voltage > /dev/null

# MCLK: 1750MHz conforme .mpt
echo "m 1 1750" | sudo tee /sys/class/drm/card1/device/pp_od_clk_voltage > /dev/null

# Aplica as configurações
echo "c" | sudo tee /sys/class/drm/card1/device/pp_od_clk_voltage > /dev/null

# Força nível máximo
echo "1" | sudo tee /sys/class/drm/card1/device/pp_dpm_sclk > /dev/null

# Mantém GPU acordada
echo "on" | sudo tee /sys/bus/pci/devices/0000:03:00.0/power/control > /dev/null
