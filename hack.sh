#!/bin/bash

TESTD=test/HACK
if [ ! -d $TESTD ]; then
    mkdir -p $TESTD
fi
ln -s $PWD/snark.jar $TESTD &> /dev/null
rm -f $TESTD/sharefile
echo > $TESTD/sharefile
cd $TESTD && java -jar snark-hack.jar --show-peers --no-commands --debug ALL $1 &> log &
