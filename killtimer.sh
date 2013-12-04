#!/bin/bash

if [ "$#" == 0 ] || [ "$1" -eq 0 ]; then
    echo "Timer disabled"
    exit 0
else
    sleep $1
    echo "$1 seconds elapsed, stopping run"
    make stop
fi

