#!/usr/bin/env bash

buildah bud -t sparsick/buildah-containerfile-plain:latest -f Containerfile-plain .
