#!/bin/bash

start="13:55"
length="2h"
url="http://81.19.85.200/ultra128.mp3" # http://audio.rambler.ru/radio/radioultra

while true
do
    if [ $(date +%H:%M) == $start ]
    then
        gpid=$(ps -p $$ -o pgid="" | awk '{print $1}')
        sleep $length && kill -9 -$gpid &
        while true
        do
            wget $url -O $(date +%H%M%S).mp3 -o /dev/null
        done
    else
        sleep 1m
    fi
done
