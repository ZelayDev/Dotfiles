#!/bin/bash

WIFI_STATUS=$(nmcli radio wifi)

ACTIVE_SSID=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d':' -f2)

if [ "$WIFI_STATUS" == "enabled" ]; then
    TOGGLE_TEXT="  Turn Wi-Fi Off"
    NETWORKS=$(nmcli -t -f SSID,SIGNAL dev wifi list --rescan no | awk -F: -v active="$ACTIVE_SSID" '!seen[$1]++ && $1 != "" && $1 != active {print $1 " (" $2 "%)"}' | sort -t'(' -k2 -nr)
else
    TOGGLE_TEXT="  Turn Wi-Fi On"
    NETWORKS=""
fi

MENU="$TOGGLE_TEXT"
if [ -n "$NETWORKS" ]; then
    MENU="$MENU\n$NETWORKS"
fi

chosen=$(echo -e "$MENU" | rofi -dmenu -i -p "Wi-Fi" -theme ~/.config/rofi/themes/wifi.rasi)

case "$chosen" in
    *"Turn Wi-Fi Off"*) nmcli radio wifi off ;;
    *"Turn Wi-Fi On"*)  nmcli radio wifi on ;;
    "")                 exit 0 ;;
    *)                  
        SSID=$(echo "$chosen" | sed 's/ ([0-9]*%)$//')
        
        if nmcli device wifi connect "$SSID" &>/dev/null; then
            notify-send "Wi-Fi" "Connected to $SSID"
        else
			notify-send "Wi-Fi" "Password required for $SSID"
            nm-connection-editor --create --type wifi
        fi
        ;;
esac
