#!/bin/bash

# ==========================================
# 1. СБОР ДАННЫХ (Sound)
# ==========================================
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
MUTE_STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "MUTED")
if [ "$MUTE_STATUS" == "MUTED" ]; then
    SOUND_LABEL="Sound (Muted)"
else
    SOUND_LABEL="Sound ($VOLUME%)"
fi

# ==========================================
# 2. ФОРМИРОВАНИЕ МЕНЮ
# ==========================================
wifi="  Wi-Fi"
sound="  $SOUND_LABEL"
bt="  Bluetooth"
share="  File Share"
cast="  Screen Cast"

# Вызов Rofi с новой темой
chosen=$(echo -e "$wifi\n$sound\n$bt\n$share\n$cast" | rofi -dmenu -i -p "Control Center" -theme ~/.config/rofi/themes/controlcenter.rasi)

case "$chosen" in
    *"Wi-Fi"*)      ~/Scripts/wifi_control ;;
    *"Bluetooth"*)  ~/Scripts/control_bt ;;
    *"Sound"*)      pavucontrol ;;
    *"File Share"*) ~/Scripts/control_share ;;
    *"Screen Cast"*) ~/Scripts/control_cast ;;
esac
