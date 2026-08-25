#! /bin/bash

# Make script fail on certain common errors to avoid hidden bugs.
# Source https://gist.github.com/akrasic/380bda362e0420be08709152c91ca1f9
set -euo pipefail

python3 -m venv .venv
source .venv/bin/activate

python -m pip install --upgrade pip

# Kubespray requirements
pip install -r dependencies/kubespray/requirements.txt

# Ansible requirements
# pip install -r ansible/requirements.txt
