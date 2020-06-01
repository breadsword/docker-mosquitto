docker-mosquitto
================

Docker image for mosquitto - instead of [eclipse-mosquitto](https://hub.docker.com/_/eclipse-mosquitto), it supports SSL (tested with PSK)

[![Docker Stars](https://img.shields.io/docker/stars/belandor/docker-mosquitto.svg)](https://hub.docker.com/r/belandor/docker-mosquitto/)
[![Docker Pulls](https://img.shields.io/docker/pulls/belandor/docker-mosquitto.svg)](https://hub.docker.com/r/belandor/docker-mosquitto/)


## Project Status

I created this container, because I wanted to connect to mqtt using SSL with PSK. It turns out, that the official mosquitto container has no SSL-support.
So I forked the container from [Thomas Kerpe](https://github.com/toke/docker-mosquitto), updated the base image and made it build on docker hub.

## Run

    docker run -ti -p 1883:1883 -p 8883:8883 -p 9001:9001 belandor/docker-mosquitto

Exposes Port 1883 (MQTT), 8883 (MQTTS), 9001 (websockets)

## Local directories / External Configuration

The container requires an external mosquitto.conf file as volume in /mosquitto/config.
Logging is done to stdout.

Volumes: /mosquitto/config and /mosquitto/data

## Build

    git clone https://github.com/breadsword/docker-mosquitto.git
    cd docker-mosquitto
    docker build .

## Other Containers

The purpose of this Container is to provide a configurable mosquitto broker with SSL support.
The Eclipse Mosquitto Project now provides a very similar Container (without SSL support):
[Eclipse Mosquitto Container](https://hub.docker.com/_/eclipse-mosquitto/) 

## Authors and license

docker-mosquitto was written by:
* **Andreas Pfeil** [GitHub](https://github.com/breadsword/)

based on docker-mosquitto by
* Thomas Kerpe | [web](https://toke.de/) | [mail](mailto:web@toke.de) | [GitHub](https://github.com/toke/)
* With contributions from:
 * [Andrea Pinazzi](https://github.com/onip)
 * [m0se](https://github.com/m0se)
 * [David Medinets](https://github.com/medined)
 * [Gavin de Kock](https://github.com/gavindekock)
 * [Raphael Ahrens](https://github.com/tantSinnister)

License: [BSD 3-Clause](https://tldrlegal.com/license/bsd-3-clause-license-%28revised%29)

