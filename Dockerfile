FROM kalilinux/kali-linux-docker

ARG BUILD_RFC3339="1970-01-01T00:00:00Z"
ARG COMMIT="local"
ARG VERSION="v0.4.0"

RUN apt-get install -y gnupg 
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get clean
RUN apt-get update && \
apt-get install --no-install-recommends -y \
ca-certificates \
expect \
openjdk-11-jdk \
curl && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
update-java-alternatives -s java-1.11.0-openjdk-amd64

WORKDIR /opt
RUN mkdir /opt/cobaltstrike
COPY ./docker-entrypoint.sh /opt/
RUN chmod +x /opt/docker-entrypoint.sh

WORKDIR /opt/cobaltstrike 

EXPOSE 50050
ENTRYPOINT ["/opt/docker-entrypoint.sh"]

STOPSIGNAL SIGKILL

LABEL org.opencontainers.image.ref.name="warhorse/cobaltstrike" \
      org.opencontainers.image.created=$BUILD_RFC3339 \
      org.opencontainers.image.authors="warhorse <warhorse@thedarkcloud.net>" \
      org.opencontainers.image.documentation="https://github.com/war-horse/docker-cobaltstrike/README.md" \
      org.opencontainers.image.description="Cobaltstrike Docker Build" \
      org.opencontainers.image.licenses="GPLv3" \
      org.opencontainers.image.source="https://github.com/war-horse/docker-cobaltstrike" \
      org.opencontainers.image.revision=$COMMIT \
      org.opencontainers.image.version=$VERSION \
      org.opencontainers.image.url="https://hub.docker.com/r/warhorse/cobaltstrike/"

ENV BUILD_RFC3339 "$BUILD_RFC3339"
ENV COMMIT "$COMMIT"
ENV VERSION "$VERSION"
