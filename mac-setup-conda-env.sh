#!/bin/sh

conda create env -n py39 python=3.9 anaconda
conda init zsh
conda activate py39

## Pytorch
conda install pytorch torchvision torchaudio -c pytorch -n py39

## JupyterLab
conda install -c conda-forge jupyterlab -n py39
