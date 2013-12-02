#!/bin/bash

SLOG=logs/test/server-`date +%d%H%M%S`.log

java -jar snark-server.jar --no-commands --debug ALL --share 0.0.0.0 sharefile &> $SLOG &
sleep 2
grep "Torrent available on " $SLOG | cut -c 28- > url.var
#tail -f $SLOG


