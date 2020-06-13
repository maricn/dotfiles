#!/bin/bash
set -e

if [[ $(cat /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq) -gt "3000000" ]]; then
  echo "lowering max freq..."
  for i in {0..7}; do
      sudo su -c "echo 3000000 > /sys/devices/system/cpu/cpufreq/policy$i/scaling_max_freq"
  done;
fi

for i in {0..7}; do
  sudo cpufreq-set -c $i -g powersave
done;

sudo cpufreq-info -o
