snark-util
==========

Set of scripts for running multiple snarks and tracing their results

# Using the util #

Initially, you must do the following:

1. Generate the seed file using this command (for a 10 MB file).

    $ echo "10000" > sharesize.var
    $ make sharefile

2. Copy the three jars necessary, the should be named:

   * snark-server.jar
   * snark-peer.jar
   * snark-hack.jar

3. Using makefile, execute the following to spawn a seeder, clients and your hacked client

    $ make all


4. To stop the clients, run:

    $ make stopcli

5. To stop the seeder, run:

    $ make stopserv

# Logs and stats #

By default the server
   