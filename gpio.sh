#!/bin/bash
# help message
if [ -z "$1" ]; then
    cat <<EOF
Usage: $0 pin value
Pin is required
Value is optional
EOF
   exit
fi

# general gpio abstraction to set value on pin
function gpio_set {
    # check if pin is already exported
    if [ ! -d /sys/class/gpio/gpio$1 ]; then
        # exprort if isn't
        echo "$1" > /sys/class/gpio/export
        sleep 0.1
        echo "out" > /sys/class/gpio/gpio$1/direction;
    fi
    # set value if passed
    if [ ! -z "$2" ]; then
        echo $2 > /sys/class/gpio/gpio$1/value
        # echo "pin $1 is set to $2"
    fi
}

if [ ! -z "$2" ]; then
    # just set value if user passed it
    gpio_set $1 $2
    exit 0
else
    # export pin and set to 1 if pin isn't exported
    if [ ! -d /sys/class/gpio/gpio$1/ ]; then
        gpio_set $1 1;
    fi
    # simple switch:
    # - set to 1 if current value is 0
    # - set to 0 if current value is 1
    # - if current value is neither 1 nor 0, just set to 1
    current=$(cat /sys/class/gpio/gpio$1/value)
    if [ $current != "1" ]; then
        gpio_set $1 1;
    elif [ $current != "0" ]; then
        gpio_set $1 0;
    else
        gpio_set $1 1;
    fi
    exit 0
fi
