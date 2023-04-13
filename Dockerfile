FROM docker.io/alpine:3.17

LABEL maintainer="ownCloud GmbH"
LABEL org.opencontainers.image.authors="ownCloud GmbH"
LABEL org.opencontainers.image.title="Tinyproxy"
LABEL org.opencontainers.image.url="https://github.com/owncloud-ops/tinyproxy"
LABEL org.opencontainers.image.source="https://github.com/owncloud-ops/tinyproxy"
LABEL org.opencontainers.image.documentation="https://github.com/owncloud-ops/tinyproxy"

ARG CONTAINER_LIBRARY_VERSION
ARG GOMPLATE_VERSION

# renovate: datasource=github-releases depName=hairyhenderson/gomplate
ENV GOMPLATE_VERSION="${GOMPLATE_VERSION:-v3.11.4}"
# renovate: datasource=github-releases depName=owncloud-ops/container-library
ENV CONTAINER_LIBRARY_VERSION="${CONTAINER_LIBRARY_VERSION:-v0.1.0}"

ADD overlay/ /


RUN addgroup -g 1001 -S app && \
    adduser -S -D -u 1001 -h /opt/app -s /sbin/nologin -G app -g app app && \
    apk --update add --virtual .build-deps curl tar && \
    apk --update add --no-cache tinyproxy && \
    curl -SsfL -o /usr/local/bin/gomplate "https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-amd64-slim" && \
    curl -SsfL "https://github.com/owncloud-ops/container-library/releases/download/${CONTAINER_LIBRARY_VERSION}/container-library.tar.gz" | tar xz -C / && \
    chmod 755 /usr/local/bin/gomplate && \
    mkdir -p /opt/app/config && \
    chown -R app:app /opt/app && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

EXPOSE 8000

USER app

ENTRYPOINT ["/usr/bin/entrypoint"]
WORKDIR /opt/app
CMD []
