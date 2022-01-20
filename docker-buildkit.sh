#!/usr/bin/env bash

docker buildx build -t sparsick/docker-buildkit:latest -f Dockerfile-multistage .