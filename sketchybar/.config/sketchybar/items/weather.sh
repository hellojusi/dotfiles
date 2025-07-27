source "$CONFIG_DIR/env.sh"
COLOR=$GREEN

sketchybar --add item weather right \
           --set weather \
                 update_freq=1200 \
		 icon.drawing=on \
		 icon.color="$COLOR" \
		 icon.font="$FONT:Bold:18.0" \
		 icon.padding_left=16 \
		 background.border_width="$BORDER_WIDTH" \
		 background.border_color="$COLOR" \
		 background.corner_radius="$CORNER_RADIUS" \
		 background.color="$BAR_COLOR" \
		 label.color="$COLOR" \
		 label.padding_left=4 \
	 	 label.padding_right=16 \
		 label.y_offset=0 \

		 script=$PLUGIN_DIR/weather.sh \
