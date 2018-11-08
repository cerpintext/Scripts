#!/bin/bash

# krisshol@stud.ntnu.no


if [ "$1" != "mute" ]; then {
    #exec --no-startup-id pactl set-sink-volume 0 $1
    pactl set-sink-volume 0 "$1"
    volume=$(amixer sget Master | awk -F"[][]" '/dB/ { print $2 }')
    notify-send "Volume:" "$volume"
} else {
    pactl set-sink-mute 0 toggle
    toggle=$(amixer sget Master | awk -F"[][]" '/dB/ { print $6 }')
    if [ "$toggle" = "off" ]; then {
        notify-send "Volume:" "Muted"
    } elif [ "$toggle" = "on" ]; then {
        notify-send "Volume:" "Unmuted"
    } else {
        notify-send "Volume:" "Something went oopsie"
    } fi
} fi
