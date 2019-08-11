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

clear
echo "====== My first script ======"
echo ""
echo -n "Display current date and time"
echo ""
date
echo ""
echo "====== Student listing ======"
echo ""
sort files/students.txt
