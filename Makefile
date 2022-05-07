default: image

all: image

image:
	docker pull tensorflow/tensorflow:latest-gpu
	docker build docker \
	--file docker/Dockerfile \
	--tag jsandesara/test_panda_tensorflow:latest
