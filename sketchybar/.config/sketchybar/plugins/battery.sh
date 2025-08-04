#!/usr/bin/env bash

source "$CONFIG_DIR/env.sh"
DEFAULT_COLOR="$YELLOW"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = ""]; then 
    exit 0
fi

case ${PERCENTAGE} in
    [7-9][0-9]|100) ICON="󱊣" COLOR="$DEFAULT_COLOR"
    ;;
    [4-6][0-9]) ICON="󱊢" COLOR="$DEFAULT_COLOR"
    ;;
    [1-3][0-9]) ICON="󱊡" COLOR= "$RED"
    ;;
    *) ICON="󰂎"
esac

if [[ $CHARGING != "" ]]; then
    ICON="󰂄"
    COLOR="$GREEN"
fi

sketchybar --set $NAME 	icon="$ICON" \
			label="${PERCENTAGE}%" \
			icon.color="$COLOR" \
			label.color="$COLOR" 

