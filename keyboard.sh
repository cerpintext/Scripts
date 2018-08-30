#!/bin/bash
# Change keyboard layout between different layouts

layouts=(us no)
layout=$(setxkbmap -query | grep "layout" | awk '{printf $2}')

case "$layout" in
    "us") num=1;;
    "no") num=0;;
    "*" ) num=0;;
esac

setxkbmap "${layouts[num]}"
echo "$?"
