snark-util
==========

Set of scripts for running multiple snarks and tracing their results

# Initialization #

Initially, you must do the following:

- Generate the seed file using this command (for a 10 MB file).

<pre><code>
$ echo "10000" > sharesize.var # in KB
$ make sharefile
</code></pre>

- Adjust the number of clients in the numcli.var
  Make sure to run `make clean' afterwards

- Copy the three jars necessary, the should be named:

   * snark-server.jar
   * snark-peer.jar
   * snark-hack.jar


   
# Running #

- Using makefile, execute the following to spawn a seeder, clients and your hacked client

<pre><code>
make all
</code></pre>

- To stop the everything, run:

<pre><code>
make stop
</code></pre>
