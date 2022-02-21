#!/bin/bash
source ${HOME}/scripts/config.sh

battery=$(upower -i $(upower -e | grep BAT) | grep -E "percentage" | sed "s:[^0-9]::g")
if [[ ${battery} -lt ${BATTERY_NOTIFY_PERCENT} ]]; then 
	source ${HOME}/scripts/send_pgpmime.sh BATTERY "Battery LOW, connect to power"
fi
