#!/usr/bin/env bash
set -x

# DO NOT EDIT THIS FILE BY HAND -- FILE IS SYNCHRONIZED REGULARLY

# Available environment variables
#
# BUILD_OPTS
# PYTHON_VERSION
# REPOSITORY
# VERSION

# Set default values

BUILD_OPTS=${BUILD_OPTS:-}
CREATED=$(date --rfc-3339=ns)
PYTHON_VERSION=${PYTHON_VERSION:-3.7}
REVISION=$(git rev-parse --short HEAD)
VERSION=${VERSION:-latest}

docker build \
    --build-arg "PYTHON_VERSION=$PYTHON_VERSION" \
    --build-arg "VERSION=$VERSION" \
    --tag "$REPOSITORY:$VERSION" \
    --label "org.opencontainers.image.created=$CREATED" \
    --label "org.opencontainers.image.revision=$REVISION" \
    --label "org.opencontainers.image.version=$VERSION" \
    --squash \
    $BUILD_OPTS .
