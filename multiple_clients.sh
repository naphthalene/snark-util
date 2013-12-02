#!/bin/bash
#set -o verbose

for i in `seq 1 10`;
do
    TESTD=test/$i
    if [ ! -d $TESTD ]; then
        mkdir -p $TESTD
    fi
    rm $TESTD/snark.jar &> /dev/null
    ln -s $PWD/snark-peer.jar $TESTD/snark.jar &> /dev/null
    rm -f $TESTD/sharefile
    cd $TESTD && java -jar snark.jar --show-peers --no-commands --debug ALL $1 &> log &
done

