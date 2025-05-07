#!/bin/bash

# Path to the gentext folder
gentext_dir="/home/nico/coderoot/gentext"

# Path to the virtual environment
venv_path="$gentext_dir/.gentext_venv"

# Activate the virtual environment
source "$venv_path/bin/activate"

# Execute the Python script with the provided arguments
python "$gentext_dir/gentext.py" "$@"

# Deactivate the virtual environment
deactivate
