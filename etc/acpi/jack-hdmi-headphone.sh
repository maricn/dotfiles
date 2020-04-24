#!/bin/bash

# The following changes are reversible if run manually after the acpi events are processed

# Set the Built-In Audio profile to Analog Stereo Duplex even when HDMI is connected
sudo -u nikola XDG_RUNTIME_DIR=/run/user/1000 pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:analog-stereo+input:analog-stereo

# Set the Built-In Audio Analog Stereo port to Speakers even when headphones are connected
sudo -u nikola XDG_RUNTIME_DIR=/run/user/1000 pactl set-sink-port alsa_output.pci-0000_00_1f.3.analog-stereo analog-output-speaker
