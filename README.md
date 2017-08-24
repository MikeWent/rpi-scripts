# rpi-scripts

Raspberry Pi 3B scripts collection

## Download this repo:
```bash
git clone git@gitlab.com:Mike_Went/rpi-scripts.git
cd rpi-scripts
ls
```

## WiFi AP

Minimal config to create WiFi access point with DHCP and WPA2-PSK.

SSID: **Raspberry Pi**, password: **mysuperstrongpassword**

How to install:
```bash
sudo apt install hostapd isc-dhcp-server
sudo cp wifi-ap/* /etc/
sudo service hostapd restart
sudo service isc-dhcp-server restart
```