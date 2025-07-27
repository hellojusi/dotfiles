#!/usr/bin/env bash

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting


source "$CONFIG_DIR/env.sh"
ICON_PADDING_RIGHT=5
ICON_MAP="$PLUGIN_DIR/icon_map.sh"
ICON_FONT="sketchybar-app-font"

if [ "$SENDER" = "front_app_switched" ] && [ ! -z "$INFO" ]; then
	echo "DEBUG: SENDER=$SENDER INFO=$INFO NAME=$NAME" >&2
	ICON=$("$ICON_MAP" "$INFO")
	echo "DEBUG: ICON=$ICON" >&2

	sketchybar --set $NAME icon=$ICON icon.font=$ICON_FONT:Regular:15.0 icon.padding_right=$ICON_PADDING_RIGHT
	sketchybar --set $NAME label="$INFO"
fi
