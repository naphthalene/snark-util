#!/bin/bash

LOOPP=true

while $LOOPP; do
    printf "`date +%M%S`  "
    for i in `ls -v test`;
    do
        TESTD=test/$i

        cmp -n10000 sharefile $TESTD/sharefile &> /dev/null
        if [ $? -eq 0 ]; then
            printf "%s:OK|" $i
        else
            printf "%s:--|" $i
        fi
    done
    printf "\n"
    sleep 1
done
