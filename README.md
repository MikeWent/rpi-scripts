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
CPU: 50.5'C 122.9'F
GPU: 49.9'C 121.8'F
```

## GPIO

Control GPIO pins with easy syntax: `gpio.sh pin value`

- set pin 18 to 1: `./gpio.sh 18 1`
- set pin 15 to 0: `gpio.sh 15 0` 
- `gpio.sh 17` sets pin 17 to 1 or 0 depending on current value. It works like a switch.

Example:

```bash
$ ./gpio.sh 18 1 # pin 18 will be set to 1
$ ./gpio.sh 15 0 # pin 15 will be set to 0

$ ./gpio.sh 17 # pin 17 will be set to 1
$ ./gpio.sh 17 # pin 17 will be set to 0
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

Requires `macchanger` package.

Changes MAC on **all** interfaces by default. But you can specify one manuaally: `randmac.sh wlan0`

## Net monitor

Requires `ifstat` and `bc` package.

Switches GPIO pins depending on current network bandwidth. Works like an indicator with LEDs connected to the GPIO.

## License

GPLv3
