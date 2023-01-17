#!/bin/bash

python3 -m venv --symlinks --upgrade-deps test-venv
source test-venv/bin/activate
pip install jupytext
pip freeze > versions.txt
jupytext --to md:myst ./example.ipynb

cat ./example.md
