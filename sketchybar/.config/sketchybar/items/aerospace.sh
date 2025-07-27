#!/usr/bin/env bash

source "$CONFIG_DIR/env.sh"

COLOR="$BLUE"

sketchybar --add event aerospace_workspace_change
sketchybar --add event aerospace_service_mode_enabled_changed

for workspace_id in $(aerospace list-workspaces --all); do
    sketchybar --add item  space."$workspace_id" left \
               --subscribe space."$workspace_id" aerospace_workspace_change \
               --set       space."$workspace_id" \
                           background.drawing=off \
                           click_script="aerospace workspace $workspace_id" \
                           label="$workspace_id" \
                           label.width=16 \
                           script="$PLUGIN_DIR/aerospace.sh $workspace_id"
done

sketchybar --add bracket spaces '/space\..*/' \
           --set         spaces background.color="$BAR_COLOR" \
                                background.corner_radius="$CORNER_RADIUS" \
				background.border_width="$BORDER_WIDTH" \
				background.border_color="$COLOR" \
				background.drawing=on \
				background.height=32
