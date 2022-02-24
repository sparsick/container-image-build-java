#!/usr/bin/env bash

set -x

builderContainer=$(buildah from "docker.io/eclipse-temurin:17.0.1_12-jre")
buildah config  --workingdir="/application" "$builderContainer"

buildah copy "$builderContainer" "*.jar" "application.jar"

buildah run  "$builderContainer"  -- java -Djarmode=layertools -jar application.jar extract

baseContainer=$(buildah from "gcr.io/distroless/java17-debian11")

buildah config --port 8080 "$baseContainer"

buildah copy --from="$builderContainer" "$baseContainer" /application/dependencies/ ./
buildah copy --from="$builderContainer" "$baseContainer" /application/spring-boot-loader/ ./
buildah copy --from="$builderContainer" "$baseContainer" /application/snapshot-dependencies/ ./
buildah copy --from="$builderContainer" "$baseContainer" /application/application/ ./

buildah config --entrypoint '["java", "org.springframework.boot.loader.JarLauncher"]' "$baseContainer"

## Commit this container to an image name
buildah commit "$baseContainer" "sparsick/buildah-multistage"

buildah push "sparsick/buildah-plain" "docker-daemon:sparsick/buildah-multistage:latest"
