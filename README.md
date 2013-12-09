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

- Copy the three jars necessary, the should be named:

   * snark-server.jar
   * snark-peer.jar
   * snark-hack.jar

# Running #

- Using makefile, execute the following to spawn a seeder, clients and your hacked client

    $ make all

- To stop everything, run:

    $ make stop

# Monitoring #

To monitor download progress (downloaded/not) the default target runs
`make stat' (or make statfull) to do this. On the right it shows 

        Starting seeder
        b5c07b6982ecebfd2d03d06714adde89  snark-server.jar
        be0e3c049c73df39404b43e581f7316c  snark-peer.jar
        7911f659c9f57ecc8c48171f3b26c423  snark-hack.jar
        Connecting clients
        1
        make[1]: Entering directory `/home/sigmat/work/2013/cs5700/snark-util'
        make[1]: Leaving directory `/home/sigmat/work/2013/cs5700/snark-util'
        1:--|2:--|HACK:--| 1414
        1:--|2:--|HACK:--| 1416
        1:--|2:--|HACK:--| 1417
        1:--|2:--|HACK:--| 1418
        1:--|2:--|HACK:OK| 1419
        1:--|2:--|HACK:OK| 1420
        1:--|2:--|HACK:OK| 1422
        1:--|2:--|HACK:OK| 1423
        1:--|2:--|HACK:OK| 1425  # <- Minutes|Seconds
        1:--|2:--|HACK:OK| 1426  #        <- The hacked client finished
        1:OK|2:OK|HACK:OK| 1428  #        <- The peers finished
        1:OK|2:OK|HACK:OK| 1429
        1:OK|2:OK|HACK:OK| 1430
        1:OK|2:OK|HACK:OK| 1431
        1:OK|2:OK|HACK:OK| 1432
        1:OK|2:OK|HACK:OK| 1433
        20 seconds elapsed, stopping run
        make[1]: Entering directory `/home/sigmat/work/2013/cs5700/snark-util'
        [CLIE] [STOPPED]


The output of the run script is also stored under logs/test/run/run.log

In addition, the `running' target shows the status of processes of the
clients and the seeder.
