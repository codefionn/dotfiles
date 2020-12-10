#!/usr/bin/env bash
export DELIM='|'

CURRENT_SINK=$(pactl list short sinks | grep RUNNING | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,')
CURRENT_NOW=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $CURRENT_SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

echo \
Version: $(uname -r) $DELIM \
Gateway: $(ip route  | grep ^default | cut -d ' ' -f 3-3) $DELIM \
Layout: $(swaymsg -t get_inputs | jq -r '[.[]|select(.type == "keyboard")][0] | .xkb_active_layout_name') $DELIM \
Volume: $CURRENT_NOW $DELIM \
$(lsblk -o MOUNTPOINT | grep -v '^$' | tail -n +2) $DELIM \
$(cat /proc/loadavg | cut -d ' ' -f 3-3) $DELIM \
$(date +'%Y-%m-%d %k:%M:%S') \
