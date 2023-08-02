
# Docker Compose for setting up ColChain experiments
The compose scripts in this folder uses the following official ColChain Docker image: [![Docker Stars](https://img.shields.io/docker/stars/caebel/colchain.svg)](https://hub.docker.com/r/caebel/colchain/) [![Docker Stars](https://img.shields.io/docker/pulls/caebel/colchain.svg)](https://hub.docker.com/r/caebel/colchain/)

In this repository, we make available Docker compose and Bash scripts to start a ColChain network given a set of data (HDT) files with the goal of running experiments over ColChain. Scripts are tested on multiple machines with Bio2RDF data.
### Requirements
Docker Compose version 2.20 or newer. Docker version 20.10 or newer.
### Contents
* `docker-compose.yml`: Docker Compose file to start each ColChain node individually and include the data in the `files` directory within the containers (to be run only by the `start.sh` file).
* `config.json`: ColChain standard config file. It should not be necessary to change this file to your setup (should work on any machine).
* `run.sh`: Bash script to bootstrap the network. Starts one node per HDT file in the `files` directory using the `docker-compose.yml` file, uploads the corresponding data files to the corresponding nodes (including partitioning and indexing), and configures the network such that all nodes have access to all the data. Will create a separate container for each node, all using the standard bridge network on Docker. Needs the local IP address of the host machine as argument (for communication between the nodes).
* `kill.sh`: Closes the ColChain nodes created by the `run.sh` script, and prunes the containers created.
* `files/`: The directory to place the HDT files in.
### Setting up the network
To bootstrap the network for experimentation with the scripts in this repository, follow the following steps:
1. Place all the HDT files (and HDT index files if possible, still works without) in the `files/` directory
2. Locate the local IP address of the host machine (e.g., using `ifconfig` command if on Linux)
3. Run the `run.sh` script with the command:

       bash run.sh <ip>

    where \<ip\> is the local IP address of the host machine

The above will start the network, partition the data, and share relevant indexes with other nodes.
The nodes will be running on ports 3000-3XYZ.
### Running experiments
After setting up the network using the steps above, run experiments using your own scripts, or use the endpoints available on the [Experiments servlet](https://github.com/ColChain/ColChain-Java/blob/main/src/main/java/org/colchain/colchain/servlet/ExperimentsServlet.java) in ColChain. For instance, make the following HTTP request on a random node to run performance experiments:

    http://<ip>:<port>/experiments?mode=performance&queries=queries&out=results&reps=1
However, be sure to include the queries in the `queries/` dir within this folder.


