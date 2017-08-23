#!/usr/bin/env python3
import os

with open('/sys/class/thermal/thermal_zone0/temp', 'r') as f:
    raw_cpu_temp = f.read()
raw_gpu_temp = os.popen('/opt/vc/bin/vcgencmd measure_temp').read()

cpu = round(int(raw_cpu_temp)/1000, 1)
gpu = raw_gpu_temp[5:-3]

print('CPU:', cpu)
print('GPU:', gpu)