#!/bin/bash

# OffSec64's System Status Script!!!
# I need to explain what it's for here...
# Version 1
# Last Modified: 12:21 PM MST   8/11/2019


# Script to show CPU utilization... Displays a bunch of weird stuff when script is ran...
mpstat > stats.txt

# Line break and header for CPU Temps, then runs the Sensors command and only writes the CPU temps for all cores.
echo   >> stats.txt
echo ***CPU TEMPS*** >> stats.txt
sensors | grep Core | cut -d "(" -f 1 >> stats.txt

# Line break and header for FAN RPM , runs sensors again but only writes the RPM of detected fans.
echo   >> stats.txt
echo ***FAN RPM*** >> stats.txt
sensors | grep RPM >> stats.txt

# Line break and header for Local IP, runs ifconfig to get the IP.
echo   >> stats.txt
echo ***LOCAL IP ADDRESS*** >> stats.txt
ifconfig | grep broadcast | cut -d " " -f 10 >> stats.txt

 # Line break and header for Exernal IP, curls the hopefully not-to-sketchy website ifconfig.me to get the IP. Then another line break.
echo   >> stats.txt                                                                                                                                                                                                                                                            
echo ***PUBLIC IP ADDRESS*** >> stats.txt
curl ifconfig.me >> stats.txt
echo   >> stats.txt

# Check out my Github @OffSec64
