# Our base image
FROM tensorflow/tensorflow:latest-gpu

USER root

COPY requirements.txt /requirements.txt

RUN pip install --upgrade pip --user
RUN pip install -r /requirements.txt

