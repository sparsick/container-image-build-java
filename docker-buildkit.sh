#!/usr/bin/env bash

docker buildx build -t sparsick/docker-buildkit:latest -f Containerfile-multistage .
