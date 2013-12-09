snark-util
==========

Set of scripts for running multiple snarks and tracing their results

# Initialization #

Initially, you must do the following:

- Generate the seed file using this command (for a 10 MB file).


        $ echo "10000" > sharesize.var # in KB
        $ make sharefile

        
- Adjust the number of clients in the numcli.var

  Make sure to run `make clean' afterwards

- Copy the three jars necessary, they should be named:

   * snark-server.jar
   * snark-peer.jar
   * snark-hack.jar

# Running #

- Using makefile, execute the following to spawn a seeder, clients and your hacked client


        $ make [all]

        
- To stop everything, run:


        $ make stop

- When shrinking the peer set, you may need to run:

### Removing test data ###

        $ make clean 

### Clearing logs ###

        $ make cleanlogs
        
# Monitoring #

To monitor download progress (downloaded/not) the default target runs
`make stat' (or make statfull) to do this. On the right it shows 

        Starting seeder
        b5c07b6982ecebfd2d03d06714adde89  snark-server.jar
        be0e3c049c73df39404b43e581f7316c  snark-peer.jar
        7911f659c9f57ecc8c48171f3b26c423  snark-hack.jar
        Connecting clients
        1:--|2:--|HACK:--| 1414
        1:--|2:--|HACK:--| 1416
        1:--|2:--|HACK:--| 1417
        1:--|2:--|HACK:--| 1418
        1:--|2:--|HACK:OK| 1419
        1:--|2:--|HACK:OK| 1420
        1:--|2:--|HACK:OK| 1422
        1:--|2:OK|HACK:OK| 1423
        1:--|2:OK|HACK:OK| 1425  # <- Minutes|Seconds
        1:--|2:OK|HACK:OK| 1426  #        <- The hacked client finished
        1:OK|2:OK|HACK:OK| 1428  #        <- The peers finished
        1:OK|2:OK|HACK:OK| 1429
        1:OK|2:OK|HACK:OK| 1430
        1:OK|2:OK|HACK:OK| 1431
        1:OK|2:OK|HACK:OK| 1432
        1:OK|2:OK|HACK:OK| 1433
        20 seconds elapsed, stopping run
        [CLIE] [STOPPED]
        [SERV] [STOPPED]


The output of the run script is also stored under logs/test/run/run.log

In addition, the `running' target shows the status of processes of the
clients and the seeder.

# Export as gist #

If you have the [defunkt/gist utility](https://github.com/defunkt/gist) setup
you can run the following to generate a private gist for sharing the
results of the test run:

        $ make gist

# Known issues #

## Freezing `make stat' ##

Sometimes the status program will freeze for several seconds. This is
caused by write locks from the Java program. When it's locked for write
it waits to read and can seem to freeze for a while.

## Starting order ##

A small change is on its way to set the starting order of the regular
and the malicious peer. Currently set to start the hacked peer after
regular peers


## Gist data ##

Currently the gist target only exports the run.log, which contains
limited data. Future gists should contain some seeder or hacked client
logs.

## ulimit/memory cap/renice ##

At this time no effort is made to cap the memory consumption of the
running instances, or to change their scheduling priority. If you notice
your CPU cores completely busy it's because of multiple Java processes
running at unrestricted loopback network read/write speeds. For more
consistent test results this would be vital.
