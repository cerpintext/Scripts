#!/bin/bash

# krisshol@stud.ntnu.no

sink_id=0
bluetooth_state=($(pactl list short | grep "bluez_sink" | awk  '{ print $1,$7 }'))

# If bluetooth sink is running:
for (( i=0; i < ${#bluetooth_state[@]}; i++)); do {
    if [ "${bluetooth_state[$i]}" == "RUNNING" ]; then {
        sink_id="${bluetooth_state[i-1]}"
    } fi
} done

if [ "$1" != "mute" ]; then {
    pactl set-sink-volume "$sink_id" "$1"
    volume=$(pulsemixer --get-volume | awk '{ print $1 }')
    notify-send "Volume:" "$volume"
} else {
    pactl set-sink-mute "$sink_id" toggle
    toggle=$(pulsemixer --get-mute)
    if [ "$toggle" = 0 ]; then {
        notify-send "Volume:" "Muted"
    } elif [ "$toggle" = 1 ]; then {
        notify-send "Volume:" "Unmuted"
    } else {
        notify-send "Volume:" "Something went oopsie"
    } fi
} fi
