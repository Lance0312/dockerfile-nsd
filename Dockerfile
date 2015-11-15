FROM debian:stable

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    nsd \
    openssl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ONBUILD RUN nsd-control-setup

EXPOSE 53

CMD ["nsd", "-d"]
