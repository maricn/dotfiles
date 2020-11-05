#!/bin/bash

for f in *.mp3; do
    BPM_FULL=$(sox "$f" -r 44100 -e float -c 1 -t raw - 2>/dev/null | ~/Tools/bpmass/bpm-tools/bpm)
    BPM=${BPM_FULL%.*}
    echo "$BPM $f"

    if [ "$BPM" -lt "100" ]; then
        mkdir -p "100/"
        mv "$f" "100/"
    elif [ "$BPM" -lt "120" ]; then
        mkdir -p "100-120/"
        mv "$f" "100-120/"
    elif [ "$BPM" -lt "135" ]; then
        mkdir -p "120-135/"
        mv "$f" "120-135/"
    elif [ "$BPM" -lt "145" ]; then
        mkdir -p "135-145/"
        mv "$f" "135-145/"
    elif [ "$BPM" -lt "165" ]; then
        mkdir -p "145-165/"
        mv "$f" "145-165/"
    fi
done;
