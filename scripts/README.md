
# Scripts
This directory contains the bash scripts used to run the experiments for ColChain. This file describes the usage of all three.

The following files are included:

* `start.sh`
This file is used to start all 128 nodes . To use it, put the file in the Jetty home directory (i.e., in the same directory as the `start.jar` file). Make sure that the `[jetty_home]/webapps/ROOT` directory containes the built ColChain project before running the script.
* `setup.sh`
This files is used to setup all 128 nodes after they have been started. The file takes 4 parameters:
    1. `path/to/config.json`
    2. `path/to/data/files`
    3. `path/to/setup/files`
    4. Chain length in the experimental setup.
* `shutdown.sh`
This file is used to shut down all ColChain experiments nodes. Run the file from anywhere, but make sure to run it with sudo/admin privileges.

To run the experiments, download and build the sources from https://github.com/ColChain/ColChain-Java and run the `start.sh` file to run the nodes. Then, run `setup.sh`, for instance using the following command:
```bash
sudo bash setup.sh config.json data/ setup10/ 100
```
Once set up, navigate to the Web interface of one of the nodes and use that to start any of the experiments. See also https://github.com/ColChain/ColChain-Java for more details.

