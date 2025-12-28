#!/bin/bash

ADDRESS=$1

echo "Setup host network..."

ip addr add $ADDRESS/24 dev eth1
ip route add default dev eth1

echo "Host network setup completed."