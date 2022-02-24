#!/usr/bin/env bash

buildah bud -t sparsick/buildah-containerfile-multistage:latest -f Containerfile-multistage .
