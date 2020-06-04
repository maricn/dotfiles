#!/bin/bash
set -e

for i in {0..7}; do
    sudo su -c "echo 3000000 > /sys/devices/system/cpu/cpufreq/policy$i/scaling_max_freq"
done;

for i in {0..7}; do
  sudo cpufreq-set -c $i -g powersave
done;

sudo cpufreq-info -o
