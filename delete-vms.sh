#!/bin/bash

virsh --connect qemu:///system destroy kafka-broker-1
virsh --connect qemu:///system destroy kafka-broker-2
virsh --connect qemu:///system destroy kafka-broker-3
virsh --connect qemu:///system destroy kafka-controller-1
virsh --connect qemu:///system destroy kafka-controller-2
virsh --connect qemu:///system destroy kafka-controller-3

virsh --connect qemu:///system undefine kafka-broker-1
virsh --connect qemu:///system undefine kafka-broker-2
virsh --connect qemu:///system undefine kafka-broker-3
virsh --connect qemu:///system undefine kafka-controller-1
virsh --connect qemu:///system undefine kafka-controller-2
virsh --connect qemu:///system undefine kafka-controller-3
