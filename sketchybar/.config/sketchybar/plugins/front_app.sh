#!/usr/bin/env bash

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

source "$CONFIG_DIR/env.sh"
source "$PLUGIN_DIR/icon_map.sh"

ICON_RESULT=$(__icon_map "$INFO")

# fallback to :default: if empty
ICON="${ICON_RESULT:-:default:}"

if [ "$SENDER" = "front_app_switched" ] && [ ! -z "$INFO" ]; then
	sketchybar --set $NAME \
  		icon="$ICON" \
		icon.font="sketchybar-app-font:Regular:16.0" \

	sketchybar --set $NAME label="$INFO"
fi

