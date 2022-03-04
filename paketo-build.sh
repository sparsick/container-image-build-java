#!/usr/bin/env bash

pack build sparsick/paketo:latest \
  --path spring-boot-app \
  --builder paketobuildpacks/builder:base \
  --buildpack paketo-buildpacks/adoptium \
  --buildpack paketo-buildpacks/java \
  --env BP_JVM_VERSION=17
