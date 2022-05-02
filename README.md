# panda_tensorflow_gpu
A simple repository to keep track of the docker images built for the workflow for using Panda GPU queues to run tensorflow.

The image can be found here: https://hub.docker.com/r/jsandesara/test_panda_tensorflow

## Build

To compile the lock file and build the Docker image locally:

``` console
$ cd docker
$ bash compile_dependencies.sh
$ cd ..
$ make
```

### Update dependencies

To add a new dependency to the environment or update a dependency:

1. Add the dependency unpinned to `docker/requirements.txt`.
2. Recompile the lock file with `docker/compile_dependencies.sh` to let the dependency solver find a version that works.
3. From the resulting `docker/requirements.lock` lock file, determine the version of the dependency and pin it in `docker/requirements.txt`.
4. Add all changes to version control.
5. Build the Docker image with `make`.
   * If there is no wheel available for the dependency (e.g. `pyspark`), add [`--no-binary <dependency name>`][pip-install-no-binary] to the list of arguments passed to `pip install` in the Dockerfile and repeat the preceding steps.

[pip-install-no-binary]: https://pip.pypa.io/en/stable/cli/pip_install/#cmdoption-no-binary
