#!/bin/bash

TESTD=test/HACK
SLOG=../../logs/$TESTD/`date +%d%H%M%S`.log

if [ ! -d $TESTD ]; then
    mkdir -p $TESTD
fi
if [ ! -d logs/$TESTD ]; then
    mkdir -p logs/$TESTD
fi
ln -s $PWD/snark.jar $TESTD &> /dev/null
rm -f $TESTD/sharefile
echo > $TESTD/sharefile
cd $TESTD && java -jar snark-hack.jar --show-peers --no-commands --debug ALL $1 &> $SLOG &
