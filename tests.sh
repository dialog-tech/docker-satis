#!/usr/bin/env bash

IMAGE_NAME="ypereirareis/docker-satis"
VERSION="4.2"

function build() {
  docker build -t "${IMAGE_NAME}:${VERSION}" .
}

function run() {
  docker run --rm "${IMAGE_NAME}:${VERSION}" bash -c "cat /satis-config/config.json && ./scripts/build.sh"
}

function test_all() {
  echo "=== START"

  build
  run

  echo "=== END"
}

test_all
