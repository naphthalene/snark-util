#!/bin/bash

TESTD=test/HACK
SLOG=../../logs/$TESTD/`date +%d%H%M%S`.log

if [ ! -d $TESTD ]; then
    mkdir -p $TESTD
fi
if [ ! -d logs/$TESTD ]; then
    mkdir -p logs/$TESTD
fi
ln -s $PWD/snark-hack.jar $TESTD/snark-hack.jar &> /dev/null
rm -f $TESTD/sharefile
# --debug ALL 
cd $TESTD && java -jar snark-hack.jar --show-peers --no-commands $1 &> $SLOG &
