#!/usr/bin/env bash

set -x

baseContainer=$(buildah from "gcr.io/distroless/java17-debian11")

buildah config  --workingdir="/application" "$baseContainer"
buildah config --port 8080 "$baseContainer"

buildah copy "$baseContainer" "*.jar" "application.jar"

buildah config --entrypoint '["java", "-jar", "application.jar"]' "$baseContainer"

## Commit this container to an image name
buildah commit "$baseContainer" "sparsick/buildah-plain"

buildah push "sparsick/buildah-plain" "docker-daemon:sparsick/buildah-plain:latest"
