FROM ubuntu:latest

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
LABEL org.opencontainers.image.created=$BUILD_DATE \
    org.opencontainers.image.licenses="BSD-3-Clause" \
    org.opencontainers.image.title="docker-mosquitto" \
    org.opencontainers.image.revision=$VCS_REF \
    org.opencontainers.image.source="https://github.com/breadsword/docker-mosquitto" \
    org.opencontainers.image.authors="Andreas Pfeil <ap+docker@gongjian.de>"

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:mosquitto-dev/mosquitto-ppa && \
    apt-get update && \
    apt-get install -y mosquitto mosquitto-clients

RUN mkdir -p /mosquitto/config /mosquitto/data
RUN chown -R mosquitto:mosquitto /mosquitto
RUN touch /mosquitto/config/mosquitto.conf
VOLUME ["/mosquitto/config", "/mosquitto/data"]


EXPOSE 1883 8883 9001

ADD docker-entrypoint.sh /usr/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
