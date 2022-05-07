# Our base image
FROM tensorflow/tensorflow:latest-gpu

USER root

COPY requirements.txt /requirements.txt
COPY requirements.lock /requirements.lock

# Use Brett Cannon's recommendations for pip-secure-install to ensure environment
# is reproducible and installed as securely as possible.
# c.f. https://www.python.org/dev/peps/pep-0665/#secure-by-design
# c.f. https://github.com/brettcannon/pip-secure-install
# c.f. https://twitter.com/brettsky/status/1486137764315688961
RUN python -m pip --no-cache-dir install --upgrade pip setuptools wheel && \
    python -m pip --no-cache-dir install \
        --no-deps \
        --require-hashes \
        --only-binary :all: \
        --requirement /requirements.lock
