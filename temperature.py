#!/usr/bin/env python3
# -*- coding: utf-8 -*-

##
# rpi-scripts
# github.com/MikeWent/rpi-scripts
##

import os

def celsius2fahrenheit(temp):
    fahrenheit = 9.0/5.0 * temp + 32
    return round(fahrenheit, 1)

with open('/sys/class/thermal/thermal_zone0/temp', 'r') as f:
    raw_cpu_temp = f.read()
cpu_c = round(int(raw_cpu_temp)/1000, 1)
cpu_f = celsius2fahrenheit(cpu_c)
print("CPU: {}'C {}'F".format(cpu_c, cpu_f))

# on some systems this info can be unavailable
if os.path.isfile("/opt/vc/bin/vcgencmd"):
    raw_gpu_temp = os.popen('/opt/vc/bin/vcgencmd measure_temp').read()
    gpu_c = float(raw_gpu_temp[5:-3])
    gpu_f = celsius2fahrenheit(gpu_c)
    print("GPU: {}'C {}'F".format(gpu_c, gpu_f))
