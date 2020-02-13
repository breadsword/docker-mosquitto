FROM ubuntu:latest

MAINTAINER Andreas Pfeil <ap+docker@gongjian.de>

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.docker.dockerfile="/Dockerfile" \
    org.label-schema.license="BSD 3-Clause" \
    org.label-schema.name="docker-mosquitto" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-url="https://github.com/breadsword/docker-mosquitto"

RUN apt-get update && \
    apt-get install -y mosquitto mosquitto-clients

RUN mkdir -p /mosqitto/config /mosquitto/data /mosquitto/log
RUN chown -R mosquitto:mosquitto /mosquitto
VOLUME ["/mosquitto/config", "/mosquitto/data", "/mosquitto/log"]


EXPOSE 1883 8883 9001

ADD docker-entrypoint.sh /usr/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
