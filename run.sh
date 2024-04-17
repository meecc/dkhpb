#!/bin/bash

# fr  https://github.com/Paperspace/fastai-docker/blob/master/fastai-fastbook/run.sh

export SHELL=/bin/bash

# mkdir /notebooks/.gradient
# echo "integrations:
#   fastai:
#     type: dataset
#     ref: paperspace/dsr4qbcrcg662pf:latest" > /notebooks/.gradient/settings.yaml


## run Once and Every
if [ -f /storage/rnup/runOnce.sh ]; then
    . /storage/rnup/runOnce.sh
fi

if [ -f /storage/rnup/runEvry1.sh ]; then
    . /storage/rnup/runEvry1.sh
fi

if [ -f /storage/rnup/runEvry2.sh ]; then
    . /storage/rnup/runEvry2.sh
fi




# jupyter lab  --allow-root --ip=0.0.0.0 --no-browser        # https://github.com/Paperspace/fastai-docker/blob/master/older-versions/fastai-v4-lab/run.sh
# jupyter "$@"      # https://github.com/Paperspace/fastai-docker/blob/master/fastai-fastbook/run.sh
# $@ (array of positional args) in bash

jupyter lab --allow-root --ip=0.0.0.0 --no-browser --ServerApp.trust_xheaders=True --ServerApp.disable_check_xsrf=False --ServerApp.allow_remote_access=True --ServerApp.allow_origin='*' --ServerApp.allow_credentials=True
# https://github.com/gradient-ai/base-container/blob/main/pt211-tf215-cudatk120-py311/Dockerfile














