#!/bin/bash

# krisshol@stud.ntnu.no

sink_id=0
bluetooth_state=($(pactl list sinks short | grep "bluez_sink" | awk  '{ print $1,$7 }'))
echo "${#bluetooth_state[@]}"
# If bluetooth sink is running:
if [[ ${#bluetooth_state[@]} -gt 0 ]]; then {
    for (( i=0; i < ${#bluetooth_state[@]}; i++)); do {
        if [[ "${bluetooth_state[$i]}" -eq "RUNNING" ]] || 
           [[ "${bluetooth_state[$i]}" -eq "SUSPENDED" ]]; then {
            sink_id="${bluetooth_state[i-1]}"
            echo "bluethooth id: $sink_id"
        } fi
    } done
} else {
    sink_id=$(pactl list sinks short | awk '{ print $1 }')
    echo "other: $sink_id"
} fi

if [ "$1" != "mute" ]; then {
    pactl set-sink-volume "$sink_id" "$1"
    volume=$(pulsemixer --get-volume | awk '{ print $1 }')
    notify-send "Volume:" "$volume"
} else {
    pactl set-sink-mute "$sink_id" toggle
    toggle=$(pulsemixer --get-mute)
    if [ "$toggle" = 1 ]; then {
        notify-send "Volume:" "Muted"
    } elif [ "$toggle" = 0 ]; then {
        notify-send "Volume:" "Unmuted"
    } else {
        notify-send "Volume:" "Something went oopsie"
    } fi
} fi
