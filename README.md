# tinyproxy

[![Build Status](https://drone.owncloud.com/api/badges/owncloud-ops/tinyproxy/status.svg)](https://drone.owncloud.com/owncloud-ops/tinyproxy/)
[![Docker Hub](https://img.shields.io/badge/docker-latest-blue.svg?logo=docker&logoColor=white)](https://hub.docker.com/r/owncloudops/tinyproxy)

Custom container image for [Tinyproxy](https://tinyproxy.github.io/).

## Ports

- 8000

## Environment Variables

```Shell
TINYPROXY_PORT=8000
TINYPROXY_BIND_SAME=False

TINYPROXY_TIMEOUT=600
TINYPROXY_LOG_LEVEL="Info"
TINYPROXY_MAX_CLIENTS=100

TINYPROXY_ALLOW_LIST=
TINYPROXY_CONNECT_PORT_LIST="80,443"

TINYPROXY_FILTER_LIST=
TINYPROXY_FILTER_URLS=False
TINYPROXY_FILTER_DEFAULT_DENY=False

TINYPROXY_BASIC_AUTH_USER=
TINYPROXY_BASIC_AUTH_PASSWORD=
```

## Build

You could use the `BUILD_VERSION` to specify the target version.

```Shell
docker build -f Dockerfile -t tinyproxy:latest .
```

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](https://github.com/owncloud-ops/tinyproxy/blob/main/LICENSE) file for details.
