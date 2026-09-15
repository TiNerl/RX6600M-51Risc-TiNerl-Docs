#!/bin/bash
# Impede suspend da GPU
echo "on" > /sys/bus/pci/devices/0000:03:00.0/power/control
echo "on" > /sys/bus/pci/devices/0000:03:00.1/power/control

sleep 3

# Aplica os clocks
echo manual > /sys/class/drm/card0/device/power_dpm_force_performance_level
echo "s 0 500" > /sys/class/drm/card0/device/pp_od_clk_voltage
echo "s 1 2450" > /sys/class/drm/card0/device/pp_od_clk_voltage
echo c > /sys/class/drm/card0/device/pp_od_clk_voltage
echo 1 > /sys/class/drm/card0/device/pp_dpm_sclk

# Mantém power control permanente
echo "on" > /sys/bus/pci/devices/0000:03:00.0/power/control
