#!/usr/bin/env bash

jib jar --from=gcr.io/distroless/java17-debian11 --target=docker://sparsick/jib-plain:latest spring-boot-example-1.3.0-SNAPSHOT.jar
