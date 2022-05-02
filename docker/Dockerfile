# Our base image
FROM atlasml/ml-base

USER root

COPY requirements.txt /requirements.txt

RUN pip install --upgrade pip --user
RUN pip uninstall -y tensorflow
RUN pip install -r /requirements.txt

