#!/bin/bash

base_image="tensorflow/tensorflow:latest-gpu"
docker pull "${base_image}"

docker run --rm \
    -v $PWD:/read \
    "${base_image}" /bin/bash -c 'command -v python3 &&
    python3 -m pip install --upgrade pip setuptools wheel && \
    python3 -m pip install --upgrade pip-tools && \
    cp /read/requirements.txt . && \
    pip-compile --generate-hashes --output-file requirements.lock requirements.txt && \
    cp requirements.lock /read/'

# Make sure the file is under user control
cp requirements.lock tmp.lock && mv --force tmp.lock requirements.lock
