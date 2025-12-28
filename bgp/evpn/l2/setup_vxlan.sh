#!/bin/bash

VTEP_IP=$1
VNI=10

echo "Starting VXLAN setup for VTEP: $VTEP_IP"

ip addr add $VTEP_IP/32 dev lo

ip link add br10 type bridge
ip addr add 192.168.10.1/24 dev br0
ip link set dev br10 up

ip link add vni10 type vxlan local $VTEP_IP dstport 4789 id $VNI nolearning
ip link set vni10 master br10
ip link set vni10 up

ip link set eth3 master br10
echo "VXLAN setup complete."
