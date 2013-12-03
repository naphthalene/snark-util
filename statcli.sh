#!/bin/bash

function clean_up {
    echo "----------------------------------------------"
    echo "----------Don't forget to stop snark! ----------"
    echo "------------------------------------------------"
    exit 0
}

trap clean_up SIGHUP SIGINT SIGTERM

TESTD=test/stat
SLOG=logs/$TESTD/`date +%d%H%M%S`.log
if [ ! -d logs/$TESTD ]; then
    mkdir -p logs/$TESTD
fi

touch $SLOG

while true; do
    for i in `ls -v test`;
    do
        TESTD=test/$i

        cmp -n1000 sharefile $TESTD/sharefile &> /dev/null
        if [ $? -eq 0 ]; then
            printf "%s:OK|" $i | tee -a $SLOG
        else
            printf "%s:--|" $i | tee -a $SLOG
        fi
    done
    printf " `date +%M%S`\n" | tee -a $SLOG
    sleep 1
done

