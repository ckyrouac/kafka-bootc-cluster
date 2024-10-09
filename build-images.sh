#!/bin/bash

USER=$1

# build container images
cd kafka-broker && podman build . -t localhost/kafka-broker:latest && cd ../
cd kafka-broker-1 && podman build . -t "quay.io/$USER/kafka-broker-1:latest" && cd ../
cd kafka-broker-2 && podman build . -t "quay.io/$USER/kafka-broker-2:latest" && cd ../
cd kafka-broker-3 && podman build . -t "quay.io/$USER/kafka-broker-3:latest" && cd ../
cd kafka-controller && podman build . -t localhost/kafka-controller:latest && cd ../
cd kafka-controller-1 && podman build . -t "quay.io/$USER/kafka-controller-1:latest" && cd ../
cd kafka-controller-2 && podman build . -t "quay.io/$USER/kafka-controller-2:latest" && cd ../
cd kafka-controller-3 && podman build . -t "quay.io/$USER/kafka-controller-3:latest" && cd ../

# push container images
podman push "quay.io/$USER/kafka-broker-1:latest"
podman push "quay.io/$USER/kafka-broker-2:latest"
podman push "quay.io/$USER/kafka-broker-3:latest"
podman push "quay.io/$USER/kafka-controller-1:latest"
podman push "quay.io/$USER/kafka-controller-2:latest"
podman push "quay.io/$USER/kafka-controller-3:latest"
