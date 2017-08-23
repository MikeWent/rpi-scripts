#!/usr/bin/env python3
import os
from sys import argv

cpufreq_path = '/sys/devices/system/cpu/cpu0/cpufreq/'

def current_governor():
    with open(cpufreq_path + 'scaling_governor', 'r') as f:
        current_governor = f.read().strip()
        return current_governor

def list_governors():
    with open(cpufreq_path + 'scaling_available_governors', 'r') as f:
        available_governors = f.read().strip().split(' ')
        return available_governors

def set_governor(governor):
    try:
        with open(cpufreq_path + 'scaling_governor', 'w') as f:
            f.write(governor)
    except:
        print('Unable to set governor.')
        exit()
        
# =================================

def print_help():
    print('Raspberry Pi governor changer')
    print()
    print('Options:')
    print('    -c            Check current active governor')
    print('    -l            List available governors')
    print('    -s [governor] Set specified governor (root)')
    print()
    exit()

if len(argv) < 2:
    print_help()

if argv[1] == '-c':
    print('Current governor:', current_governor())
    exit()

if argv[1] == '-l':
    available_governors = list_governors()
    pretty_string = ''
    for governor in available_governors:
        pretty_string += '\n - ' + governor
    print('Available governors:'+pretty_string)
    exit()

if argv[1] == '-s':
    if len(argv) < 3:
        print('Specifiy governor to apply')
        print('Example: ./governor.py -s powersave')
        exit()
    governor = argv[2]
    set_governor(governor)
    print('Governor set to', governor)
    exit()
    
else:
    print_help()
