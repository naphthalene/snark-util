#!/bin/bash

function clean_up {
    echo "----------------------------------------------"
    echo "----------Don't forget to stop snark! ----------"
    echo "------------------------------------------------"
    exit 0
}

trap clean_up SIGHUP SIGINT SIGTERM

#
CMPCMD="cmp "
TESTD=test/stat
SLOG=logs/$TESTD/`date +%d%H%M%S`.log



if [ ! -d logs/$TESTD ]; then
    mkdir -p logs/$TESTD
fi
touch $SLOG


# Do a full stat
if [ $# -eq 2 ]; then
    CMPCMD="$CMPCMD-n$2 "
fi


while true; do
    for i in `ls -v test`;
    do
        TESTD=test/$i

        $CMPCMD sharefile $TESTD/sharefile &> /dev/null
        if [ $? -eq 0 ]; then
            printf "%s:OK|" $i | tee -a $SLOG
        else 
            printf "%s:--|" $i | tee -a $SLOG
        fi
    done
    printf " `date +%M%S`\n" | tee -a $SLOG
    sleep 1
done

