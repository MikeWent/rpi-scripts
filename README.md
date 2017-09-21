# rpi-scripts

Raspberry Pi 3B scripts collection

## Download
You need `git` and `python3`.
```bash
sudo apt install python3 git
git clone https://gitlab.com/Mike_Went/rpi-scripts.git
```

## Comaptibility
Does **not** work with Raspbian 9 and up.
Tested and 100% compatible distro: **Raspbian 8.0 (jessie)**

Download here: [Raspbian 8 Lite](http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2017-07-05/) or [Rasbian 8](http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-07-05/)

## WiFi AP
Minimal config to create WiFi access point with DHCP and WPA2-PSK.

Default SSID: **Raspberry Pi**, default password: **mysuperstrongpassword**

How to install:
```bash
sudo apt install hostapd dnsmasq
sudo cp -r wifi-ap/* /etc/
sudo service hostapd restart
sudo service dnsmasq restart
```

## Forward traffic
For example, if eth0 is configured to use internet and wlan0 is access point (WiFi hotspot), you can do this:
```bash
./forward.sh eth0 wlan0
```
*Poof!* You have access to the internet on your wlan0 now.

## Temperature
Use `./temperature.py` or `watch -tn 1 ./temperature.py`

Example output:
```
CPU: 50.5°C 122.9°F
GPU: 49.9°C 121.8°F
```

## CPU governor
Raspberry Pi supports several CPU governors. For example: _powersave_, _ondemand_, _performance_.

List available: `./governor.py -l`
```
Available governors:
 - conservative
 - ondemand
 - userspace
 - powersave
 - performance
 - schedutil
```

Current governor: `./governor.py -c`
```
Current governor: powersave
```

Set governor: `sudo ./governor.py -s performance`


## License
GPLv3
