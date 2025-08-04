#!/usr/bin/env bash

source "$CONFIG_DIR/env.sh"

COLOR="$MAUVE"

sketchybar --add item clock right \
	--set clock update_freq=1 \
	icon.padding_left=15 \
	icon.padding_right=5 \
	icon.color="$COLOR" \
	icon="󰃰" \
	label.color="$COLOR" \
	label.padding_right=15 \
	label.y_offset=1 \
	background.corner_radius="$CORNER_RADIUS" \
	background.padding_right=0 \
	background.padding_left=15 \
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$COLOR" \
	background.color="$BAR_COLOR" \
	background.drawing=on \
	script="$PLUGIN_DIR/clock.sh"
