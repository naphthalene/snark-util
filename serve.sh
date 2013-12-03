#!/bin/bash

TESTD=test/server
SLOG=logs/$TESTD/`date +%d%H%M%S`.log

if [ ! -d logs/$TESTD ]; then
    mkdir -p logs/$TESTD
fi

java -jar snark-server.jar --no-commands --debug ALL --share 0.0.0.0 sharefile &> $SLOG &
sleep 2
grep "Torrent available on " $SLOG | cut -c 28- > url.var


