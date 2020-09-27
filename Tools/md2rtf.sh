#!/bin/bash

# export LC_CTYPE=UTF-8
# pandoc -t rtf -s | wl-copy
TMP_FILENAME="/home/nikola/tmp/pandoc_html_`date +%s`.html"
touch $TMP_FILENAME && \
    pandoc -sf markdown+smart -t html $1 -o "$TMP_FILENAME" --css /home/nikola/gruvbox.css && \
    firefox $TMP_FILENAME
