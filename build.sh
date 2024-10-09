#!/bin/bash

set -e

USER=$1

# pull kafka base image
podman pull docker.io/apache/kafka:3.8.0

./build-images.sh "$USER"

# build disk images
rm -rf disk-images

build_bootc_disk() {
  NAME=$1
  rm -rf "disk-images/$NAME"
  mkdir -p "disk-images/$NAME"
  podman run --rm --privileged \
    -v /var/lib/containers/storage:/var/lib/containers/storage \
    --security-opt label=type:unconfined_t \
    -v "./disk-images/$NAME:/output" \
    -v "./bib.toml:/config.toml:ro" \
    quay.io/centos-bootc/bootc-image-builder:latest build --type qcow2 --local "quay.io/$USER/$NAME"
}

build_bootc_disk kafka-broker-1
build_bootc_disk kafka-broker-2
build_bootc_disk kafka-broker-3

build_bootc_disk kafka-controller-1
build_bootc_disk kafka-controller-2
build_bootc_disk kafka-controller-3

./create-vms.sh

echo "Done!"
