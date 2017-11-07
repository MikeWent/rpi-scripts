#!/bin/bash
sudo ip link set $1 down
sudo macchanger -A -b $1
sudo ip link set $1 up
