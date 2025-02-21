#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <wm_class_prefix> <new_wm_class>"
  exit 1
fi
# The beginning of the WM_CLASS you are looking for
CLASS_PREFIX="$1"
NEW_WM_CLASS_NAME="$2"

# Get all window IDs
window_ids=$(xwininfo -root -tree | grep '\"' | awk '{print $1}')

# Iterate over each window ID
for id in $window_ids; do
  # Get the WM_CLASS property of the window
  wm_class=$(xprop -id $id WM_CLASS 2>/dev/null)

  # Check if the WM_CLASS starts with the given prefix
  if echo "$wm_class" | grep -q "^WM_CLASS(STRING) = \"$CLASS_PREFIX"; then
    "/opt/tlauncher/set_wm_class" "$id" "$NEW_WM_CLASS_NAME"
  fi
done
