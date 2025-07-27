#!/usr/bin/env bash

source "$CONFIG_DIR/env.sh"

COLOR="$FLAMINGO":

sketchybar --add item  front_app left \
  	   --subscribe front_app front_app_switched \
	   --set       front_app script="$PLUGIN_DIR/front_app.sh" \
	               icon.drawing=on \
		       background.border_width="$BORDER_WIDTH" \
		       background.border_color="$COLOR" \
		       background.corner_radius="$CORNER_RADIUS" \
		       background.color="$BAR_COLOR" \
		       label.color="$COLOR" \
		       label.padding_left=15 \
	 	       label.padding_right=15 \
		       label.y_offset=1 \
		       associated_display=active
