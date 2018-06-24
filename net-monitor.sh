#!/bin/bash

# requirements:
#    apt install ifstat bc

# download and upload (kbit/s)
max_download=200
max_upload=100
# interface (eth0, ppp0)
interface=eth0
# gpio pins with leds
download_led=13
upload_led=14
# delay between bandwidth checks in secs (minimum 0.1)
delay=0.3

ifstat -b -i $interface $delay | while read down up; do
    # filter output of ifstat with regular expression -> allow only digits
    if [[ $down$up =~ ^-?[0-9\.]+$ ]]; then
        # download led
        if [ $(echo "$down>$max_download" | bc) -eq "1" ]; then
            # switch ON
            ./gpio.sh $download_led 1
        else
            # switch OFF
            ./gpio.sh $download_led 0
        fi
        # upload led
        if [ $(echo "$up>$max_upload" | bc) == "1" ]; then
            # switch ON
            ./gpio.sh $upload_led 1
        else
            # switch OFF
            ./gpio.sh $upload_led 0
        fi
    fi
done

