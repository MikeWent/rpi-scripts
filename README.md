# rpi-scripts

Raspberry Pi 3B scripts collection

## Comaptibility

Does **not** work with Raspbian 9 and up.
Tested and 100% compatible distro: **Raspbian 8.0 (jessie)**

Download here: [Raspbian 8 Lite](http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2017-07-05/) or [Rasbian 8](http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-07-05/)

## Download this repo:
```bash
git clone git@gitlab.com:Mike_Went/rpi-scripts.git
cd rpi-scripts
ls
```

## WiFi AP

Minimal config to create WiFi access point with DHCP and WPA2-PSK.

Default SSID: **Raspberry Pi**, default password: **mysuperstrongpassword**

How to install:
```bash
sudo apt install hostapd isc-dhcp-server
sudo cp -r wifi-ap/* /etc/
sudo service hostapd restart
sudo service isc-dhcp-server restart
```