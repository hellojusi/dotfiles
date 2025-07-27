#!/usr/bin/env bash

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

ICON_PADDING_RIGHT=5
ICON_MAP="$PLUGIN_DIR/icon_map.sh"


if [ "$SENDER" = "front_app_switched" ] && [ ! -z "$INFO" ]; then
	ICON=$("$ICON_MAP" "$INFO")

	sketchybar --set $NAME icon=$ICON icon.font=$ICON_FONT:Bold:16.0 icon.padding_right=$ICON_PADDING_RIGHT
	sketchybar --set $NAME.name label="$INFO"
fi
