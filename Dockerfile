ARG BASE_IMAGE=python:3.8.5-slim-buster
FROM $BASE_IMAGE as base
WORKDIR /app
ENV PYTHONPATH "${PYTHONPATH}:/app"

##
# Install any runtime depenencies here
ENV RUNTIME_DEPENDENCIES="ffmpeg"

RUN apt-get update \
    && apt-get install -y $RUNTIME_DEPENDENCIES \
&& rm -rf /var/lib/apt/lists/*

ENV BUILD_DEPENDENCIES="build-essential"

COPY requirements.txt /app/requirements.txt

# Install any build dpendencies depenencies here
RUN apt-get update \
    && apt-get install -y $BUILD_DEPENDENCIES \
    && pip install --no-cache-dir -r requirements.txt \
&& apt-get remove -y $BUILD_DEPENDENCIES \
&& apt-get auto-remove -y \
&& rm -rf /var/lib/apt/lists/*
