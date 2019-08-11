#!/bin/bash

#############################################################################
#                                                                           #
# Name: machine-report.sh                                                   #
#                                                                           #
# Author: Gilvan Ribeiro                                                    #
# Creation date: 2019-08-11                                                 #
#                                                                           #
# Description: The scripts generates a report with main server information. #
#                                                                           #
# Example of use: ./machine-report.sh                                       #
#                                                                           #
#############################################################################

KERNEL=$(uname -r)
HOSTNAME=$(hostname)
CPU_UNITS=$(cat /proc/cpuinfo | grep "model name" | wc -l)
CPU_MODEL=$(cat /proc/cpuinfo | grep "model name" | head -n1 | cut -c14-)
TOTAL_MEMORY=$(expr $(cat /proc/meminfo | grep MemTotal | tr -d ' ' | cut -d: -f2 | tr -d kB) / 1024) # MB
FILESYS=$(df -h | egrep -v '(tmpfs|udev)')
UPTIME=$(uptime -s)

clear
echo "======================================================================"
echo "Machine report: $HOSTNAME"
echo "Date/Time: $(date)"
echo "======================================================================"
echo
echo "Machine active from: $UPTIME"
echo
echo "Kernel version: $KERNEL"
echo
echo "Total memory: $TOTAL_MEMORY MB"
echo
echo "Partitions: "
echo "$FILESYS"
echo
echo "======================================================================"
