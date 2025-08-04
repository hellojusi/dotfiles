#!/usr/bin/env bash

source "$CONFIG_DIR/env.sh"

COLOR="$TEXT"

# Battery status
sketchybar --add item battery right \
	   --set battery update_freq=120 \
	   		 label.color="$COLOR" \
			 icon.color="$COLOR" \
			 label.padding_right=15 \
	   	 	 script="$PLUGIN_DIR/battery.sh" \
	   --subscribe battery system_woke power_source_change

# CPU usage
sketchybar --add item cpu right \
           --set cpu  update_freq=2 \
                      icon= \
		      icon.color="$COLOR" \
		      label.color="$COLOR" \
                      script="$PLUGIN_DIR/cpu.sh"

# Memory usage
sketchybar --add item ram right \
	   --set ram update_freq=5 \
	   	     icon=􀫦 \
		     icon.color="$COLOR" \
		     label.color="$COLOR" \
		     icon.padding_left=15 \
		     label="$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%02.0f\n", 100-$5"%") }')%"

# Bracket grouping
sketchybar --add bracket stats battery cpu ram \
	   --set stats background.color="$BAR_COLOR" \
	   	       background.corner_radius="$CORNER_RADIUS" \
		       background.border_width="$BORDER_WIDTH" \
		       background.border_color="$COLOR" \
		       background.drawing=on \
		       background.height=32
