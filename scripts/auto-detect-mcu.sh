#!/usr/bin/env bash
CONFIG_PATH="/home/pi/klipper_config/v-core-3/mcu-detection.cfg"

id="$(ls /dev/serial/by-id/usb-Klipper-* | head -n1)"

if [[ -z "$id" ]]; then
    echo "$(date +"%Y-%m-%d %T"): MCU Detection Error: Cannot detect Klipper device" >> /tmp/klippy.log
    exit 1
fi

echo -e "[mcu]\nserial: $id" > "$CONFIG_PATH"