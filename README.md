# Container Image Build Samples for Java Application

This repository demonstrates tools for container image build for Java application.

It is the basic for the [article](https://www.informatik-aktuell.de/entwicklung/methoden/container-images-deep-dive-101-wege-zum-bauen-und-bereitstellen.html) "Container Images Deep Dive" (in German)

## CLI tools

* Docker Plain
* Docker Multistage
* Docker Buildkit
* Podman
* Buildah
* Paketo / Buildpack
* Jib

## Tool Integration in Maven

In 'spring-boot-app' I demonstrate how to integrate some of the above tools in Maven build tool.

* docker-maven-plugin
* jib-maven-plugin
* spring-boot-maven-plugin (Buildpack integration)
