#!/bin/bash
# Change keyboard layout between different layouts


layouts=(us no)

now=$(setxkbmap -query | grep 'layout' | awk '{print $2}')

export i=0
for opt in "${layouts[@]}"; do
    if [[ $opt =~ $now ]]; then
        ((i+=1))
        if [ $i -ge ${#layouts[@]} ]; then
            i=$((0))
        fi
        setxkbmap "${layouts[i]}"
        echo "success"
        exit
    fi
    ((i+=1))
done 
echo "fail"
