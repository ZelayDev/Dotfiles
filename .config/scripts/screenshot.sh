#!/bin/bash

grim -g "$(slurp)" - | wl-copy
notify-send "Screenshot" "Copied to clipboard"
