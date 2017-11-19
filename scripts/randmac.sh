#!/bin/bash
function set_iface_random_mac {
    sudo ip link set $1 down
    echo "$1 turned off"
    sudo macchanger -A $1
    sudo ip link set $1 up
    echo "$1 turned on"
}

# if args are empty
if [ -z "$1" ];
    then
    # change MAC of all interfaces
    for iface in $(ls /sys/class/net); do
        set_iface_random_mac $iface
        echo ""
    done
else
    # only selected
    set_iface_random_mac $1
fi
