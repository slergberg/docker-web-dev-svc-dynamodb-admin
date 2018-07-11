#!/usr/bin/env sh

set -x

healthcheck_server() {
  curl --fail http://0.0.0.0:8001/ \
    || exit 1
}

healthcheck_server
