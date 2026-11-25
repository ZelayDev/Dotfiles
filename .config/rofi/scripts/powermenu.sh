#!/bin/bash

lock="  Lock"
suspend="  Sleep"
logout="  Logout"
reboot="  Reboot"
shutdown="  Poweroff"

chosen=$(echo -e "$shutdown\n$reboot\n$lock\n$suspend\n$logout" | rofi -dmenu -i -p "" -theme ~/.config/rofi/themes/powermenu.rasi)

case "$chosen" in
    "$shutdown") systemctl poweroff ;;
    "$reboot") systemctl reboot ;;
    "$lock") hyprlock;;
    "$suspend") systemctl suspend ;;
    "$logout") loginctl terminate-user $USER;;
esac
