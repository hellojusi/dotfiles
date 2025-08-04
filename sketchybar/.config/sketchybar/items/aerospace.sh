#!/usr/bin/env bash

source "$CONFIG_DIR/env.sh"
source "$PLUGIN_DIR/icon_map.sh"

COLOR="$BLUE"

# Subscribe to Aerospace events
sketchybar --add event aerospace_workspace_change
sketchybar --add event aerospace_service_mode_enabled_changed

# Add polling timer to keep icons fresh
sketchybar --add item workspace_refresher center \
           --set workspace_refresher script="$PLUGIN_DIR/aerospace.sh" \
                                     update_freq=5 \
           --subscribe workspace_refresher routine

# Small spacer item
sketchybar --add item aerospacer left \
	   --set aerospacer width=10 
			    drawing=on 

# Workspace items
for workspace_id in $(aerospace list-workspaces --all); do
  # Get current icons
  windows=$(aerospace list-windows --workspace "$workspace_id" | awk -F'|' '{ print $2 }' | sed 's/^ *//;s/ *$//' | uniq)
  icons=""
  for window in $windows; do
    icon=$(__icon_map "$window")
    icons+="$icon"
  done

  # Add item
  sketchybar --add item space."$workspace_id" left \
             --subscribe space."$workspace_id" aerospace_workspace_change \
             --set space."$workspace_id" \
                   background.drawing=off \
                   click_script="aerospace workspace $workspace_id" \
                   icon="$workspace_id" \
                   icon.y_offset=0 \
                   label="$icons" \
                   label.font="sketchybar-app-font:Regular:13.0" \
                   label.padding_left=5 \
                   label.padding_right=5 \
                   script="$PLUGIN_DIR/aerospace.sh $workspace_id"
done

# Bracket grouping
sketchybar --add bracket spaces aerospacer '/space\..*/' \
           --set spaces background.color="$BAR_COLOR" \
                        background.corner_radius="$CORNER_RADIUS" \
                        background.border_width="$BORDER_WIDTH" \
                        background.border_color="$COLOR" \
                        background.drawing=on \
                        background.height=32

