snark-util
==========

Set of scripts for running multiple snarks and tracing their results

# Usage #

Initially, you must do the following:

- Generate the seed file using this command (for a 10 MB file).

<pre><code>
$ echo "10000" > sharesize.var # in KB
$ make sharefile
</code></pre>

- Copy the three jars necessary, the should be named:

   * snark-server.jar
   * snark-peer.jar
   * snark-hack.jar

- Using makefile, execute the following to spawn a seeder, clients and your hacked client

<pre><code>
make all
</code></pre>

- To stop the clients, run:

<pre><code>
make stopcli
</code></pre>

- To stop the seeder, run:

<pre><code>
make stopserv
</code></pre>
