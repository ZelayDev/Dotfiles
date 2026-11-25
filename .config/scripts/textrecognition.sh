#!/bin/bash

grim -g "$(slurp)" - | tesseract - - -l rus+eng 2>/dev/null | wl-copy
notify-send "Text recognition" "Text copied to clipboard"
