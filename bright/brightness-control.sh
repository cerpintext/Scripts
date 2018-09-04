#!/bin/bash

# Manual hacky brightness control.
# krisshol@stud.ntnu.no

brightness='/sys/class/backlight/intel_backlight/brightness'
max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
new=$(cat $brightness)

if [ "$1" = "-inc" ]; then
    new=$(( new+$2 ))
	if [ "$new" -gt "$max_brightness" ]; then
		new=$max_brightness
	fi
fi
if [ "$1" = "-dec" ]; then
    new=$(( new - $2 ))
	if [ "$new" -lt 0 ]; then
		new=0
	fi
fi
echo "$new" | tee "$brightness"

