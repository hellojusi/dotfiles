#!/usr/bin/env bash

source "$CONFIG_DIR/env.sh"
source "$PLUGIN_DIR/icon_map.sh"

HIGHLIGHT_COLOR=$GREEN

# Get fresh focused workspace only if called via polling (not by event)
if [ "$SENDER" = "routine" ]; then
  FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
fi

# Refresh workspace icons and highlight
for workspace_id in $(aerospace list-workspaces --all); do
  windows=$(aerospace list-windows --workspace "$workspace_id" | awk -F'|' '{ print $2 }' | sed 's/^ *//;s/ *$//' | uniq)

  icons=""
  for window in $windows; do
    icon=$(__icon_map "$window")
    icons+="$icon"
  done

  if [ "$workspace_id" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set space."$workspace_id" \
               label="$icons" \
               label.highlight=on \
               label.highlight_color="$HIGHLIGHT_COLOR" \
               icon.highlight=on \
               icon.highlight_color="$HIGHLIGHT_COLOR"
  else
    sketchybar --set space."$workspace_id" \
               label="$icons" \
               label.highlight=off \
               icon.highlight=off
  fi
done

# Handle service mode toggle
if [ "$SENDER" = "aerospace_service_mode_enabled_changed" ]; then
  if [ "$AEROSPACE_SERVICE_MODE_ENABLED" = true ]; then
    sketchybar --set workspaces_service_mode label.drawing=on
  else
    sketchybar --set workspaces_service_mode label.drawing=off
  fi
fi

