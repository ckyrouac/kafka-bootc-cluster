#!/bin/bash

# start the VMs
start_vm() {
  NAME=$1
  CPUS=$2
  MEM=$3

  virt-install \
      --connect "qemu:///system" \
      --name "$NAME" \
      --cpu host \
      --vcpus "$CPUS" \
      --memory "$MEM" \
      --network network=default \
      --noautoconsole \
      --import --disk "./disk-images/$NAME/qcow2/disk.qcow2,format=qcow2" \
      --os-variant fedora-eln
}

start_vm kafka-broker-1 2 4096
start_vm kafka-broker-2 2 4096
start_vm kafka-broker-3 2 4096

start_vm kafka-controller-1 2 2048
start_vm kafka-controller-2 2 2048
start_vm kafka-controller-3 2 2048
