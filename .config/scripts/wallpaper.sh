#!/bin/bash

if [ -f "$1" ]; then
        pgrep awww-daemon > /dev/null || awww-daemon &
        awww img "$1" && echo "$1" > ~/.config/hypr/last_wallpaper
    else
        echo "File not found: $1"
    fi
