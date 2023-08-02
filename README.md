
# ColChain Experiments
[![Docker Stars](https://img.shields.io/docker/stars/caebel/colchain.svg)](https://hub.docker.com/r/caebel/colchain/) [![Docker Stars](https://img.shields.io/docker/pulls/caebel/colchain.svg)](https://hub.docker.com/r/caebel/colchain/)

This repository contains information, supplementary material, and the experimental setup for the ColChain experiments.

The repository containse the following directories:

* **compose**: Docker Compose file and scripts to setup a network automatically given a set of data files.
* **logs**: Containing the log files of the experimental results.
* **figures**: Containing the figues created for the experimental evaluation (both the ones in the paper and the ones that were created but did not make it).
* **scripts**: Any (bash) scripts used to setup and run the experiments.
* **queries**: The queries used in the experimental evaluation.
* [Download](https://relweb.cs.aau.dk/colchain) the fragment HDT files, indexes, as well as the setup files including the update chains on the following link: https://relweb.cs.aau.dk/colchain.

To run the experiments for ColChain, either do so by either using the official [Docker image](https://hub.docker.com/r/caebel/colchain/) and the [Docker Compose](compose) scripts in the **compose** folder, or using the sources from the official [repository](https://relweb.cs.aau.dk/colchain) and the scripts in the **scripts** folder.

We downloaded the [LargeRDFBench](https://github.com/dice-group/LargeRDFBench) data files and converted them to the HDT format. We then let ColChain build the fragments and the PPBF index slices for each fragment. All files (HDT and PPBF) will be available on our website.


