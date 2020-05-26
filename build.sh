#!/bin/sh
set -e

WXGTK_VERSION=${1:-3.0.4-r5}
DOCKER_REPO="docker.io/sq7lrx/wxgtkbase"

[ -e "${WXGTK_VERSION}" ] && echo "usage: `basename $0` <WXGTK_VERSION>" && exit 1

podman build -t "${DOCKER_REPO}:alpine-${WXGTK_VERSION}-dev" --build-arg WXGTK_VERSION=${WXGTK_VERSION} --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -f Dockerfile.dev .
podman build -t "${DOCKER_REPO}:alpine-${WXGTK_VERSION}" --build-arg WXGTK_VERSION=${WXGTK_VERSION} --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -f Dockerfile .
podman push "${DOCKER_REPO}:alpine-${WXGTK_VERSION}-dev"
podman push "${DOCKER_REPO}:alpine-${WXGTK_VERSION}"

