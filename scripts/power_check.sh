#!/bin/bash

battery=$(upower -i $(upower -e | grep BAT) | grep -E "percentage" | sed "s:[^0-9]::g")
if [[ ${battery} -lt 30 ]]; then 
	source ${HOME}/scripts/send_message.sh BATTERY "Battery LOW, connect to power"
fi
