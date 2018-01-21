# rpi-scripts

Raspberry Pi 3B scripts collection

## Comaptibility

Tested and 100% compatible: [Raspbian 8 Lite (jessie)](http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2017-07-05/)

Now testing Raspbian 9.1 (stretch)

## Forward traffic

For example, if eth0 is configured to use internet and wlan0 is access point (WiFi hotspot), you can do this:

```bash
forward.sh eth0 wlan0
```

*Poof!* You have access to the internet on your wlan0 now.

## Temperature

Just shows current CPU & GPU temperature. Real-time monotor: `watch -tn 1 ./temperature.py`

Example output:

```
CPU: 50.5°C 122.9°F
GPU: 49.9°C 121.8°F
```

## CPU governor

Raspberry Pi supports several CPU governors. For example: _powersave_, _ondemand_, _performance_.

List available: `governor.py -l`

```
Available governors:
 - conservative
 - ondemand
 - userspace
 - powersave
 - performance
 - schedutil
```

Current governor: `governor.py -c`

```
Current governor: powersave
```

Set governor: `sudo ./governor.py -s performance`

## Random MAC

Needs `macchanger` package to work.

Changes MAC on **all** interfaces by default. But you can specify one manuaally: `randmac.sh wlan0`

## License

GPLv3
