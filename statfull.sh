#!/bin/bash

for i in `ls -v test`;
do
    TESTD=test/$i

    cmp sharefile $TESTD/sharefile &> /dev/null
    if [ $? -eq 0 ]; then
        printf "%s:OK|" $i
    else
        printf "%s:--|" $i
    fi
done
printf " `date +%M%S`\n"
