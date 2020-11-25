# ColChain Experiments
This repository contains information, supplementary material, and the experimental setup for the ColChain experiments.

The repository containse the following directories:

* logs: Containing the log files of the experimental results.
* figures: Containing the figues created for the experimental evaluation (both the ones in the paper and the ones that were created but did not make it).
* scripts: Any (bash) scripts used to setup and run the experiments.
* queries: The queries used in the experimental evaluation.
* [Download](https://gofile.io/d/63MweG) the fragment HDT files, indexes, as well as the setup files including the update chains on the following link: https://gofile.io/d/SyjFAC.

To run the experiments for ColChain, download the setup files in this repository and go to https://github.com/ColChain/ColChain-Java to download the sources for ColChain. Use the scripts in this repository to start the nodes and follow the instructions in that repository to run the experiments.

We downloaded the [LargeRDFBench](https://github.com/dice-group/LargeRDFBench) data files and converted them to the HDT format. We then let ColChain build the fragments and the PPBF index slices for each fragment. All files (HDT and PPBF) will be available on our website.

