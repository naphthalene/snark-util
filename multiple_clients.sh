#!/bin/bash
#set -o verbose

for i in `seq 1 $2`;
do
    TESTD=test/$i
    SLOG=../../logs/$TESTD/`date +%d%H%M%S`.log
    if [ ! -d $TESTD ]; then
        mkdir -p $TESTD
    fi
    if [ ! -d logs/$TESTD ]; then
        mkdir -p logs/$TESTD
    fi

    rm $TESTD/snark.jar &> /dev/null
    ln -s $PWD/snark-peer.jar $TESTD/snark-peer.jar &> /dev/null
    rm -f $TESTD/sharefile
    cd $TESTD && java -jar snark-peer.jar --show-peers --no-commands --debug ALL $1 &> $SLOG &
done
