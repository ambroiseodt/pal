#!/bin/bash

# Change this variable to put your own path, the prefix should point to the root of the repository
CODE_PATH="./projects/"

# choose if you want to do a `compression` or a `generalization` study
mode="compression"
# mode="generalization"

# This folder can be launch from bash, for example from the root of the repository
# ```shell
# bash examples/bash_script.sh
# ```

# Launch some training run iteractively
python ${CODE_PATH}factorization/train.py run --mode ${mode} --input-factors '[4, 2, 3]' --output-factors '[4, 3]'

# # to better understand the different parameters you can run the following
python ${CODE_PATH}factorization/train.py run --help

# Launch experiments from json interface
# You can launch some individual runs
python ${CODE_PATH}factorization/train.py json ${CODE_PATH}/examples/config_runs.json --mode ${mode}  --save-ext my_run_folder

# You can launch a grid
python ${CODE_PATH}factorization/train.py json-grid examples/config_grids.json --mode ${mode}  --save-ext my_grid_folder

# You can equally overwrite some parameters from the command line
# For example, you can override all the learning rate defined in the config_grids.json
python ${CODE_PATH}factorization/train.py json-grid examples/config_grids.json --mode ${mode}  --save-ext my_grid_folder --learning-rate 1e1

# The results will be saved in the save directory defined from the .ini config file at the top of the repository
# To aggregate all the experiment configuration in a single json file, you can use the following command
python ${CODE_PATH}factorization/analysis.py aggregate my_grid_folder
python ${CODE_PATH}factorization/analysis.py aggregate my_run_folder
# You can then easily browse through the results of your runs.