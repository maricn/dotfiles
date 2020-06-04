#!/bin/bash
set -e

if [ "$1" == "--turbo" ]; then
    echo "Turbo mode detected..."
    for i in {0..7}; do
        sudo su -c "echo 4800000 > /sys/devices/system/cpu/cpufreq/policy$i/scaling_max_freq"
    done;
else
    for i in {0..7}; do
        sudo su -c "echo 3000000 > /sys/devices/system/cpu/cpufreq/policy$i/scaling_max_freq"
    done;
fi

for i in {0..7}; do
  sudo cpufreq-set -c $i -g performance
done;

sudo cpufreq-info -o
