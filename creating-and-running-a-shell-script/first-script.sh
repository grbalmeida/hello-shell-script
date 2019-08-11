#!/bin/bash

#################################################################################
#                                                                               #
# first-script.sh - First script                                                #
#                                                                               #
# Author: Gilvan Ribeiro                                                        #
# Creation date: 2019-08-10                                                     #
#                                                                               #
# Description: Script showing current date and time and displaying student list #
#                                                                               #
# Example of use: ./first-script.sh                                             #
#                                                                               #
#################################################################################

STUDENT_FILE=files/students.txt
DATE=$(date +%D)
TIME=$(date +%H:%M:%S)

clear
echo "====== My first script ======"
echo ""
echo "Display current date: $DATE"
echo "Display current time: $TIME"
echo ""
echo "====== Student listing ======"
echo ""
sort $STUDENT_FILE
