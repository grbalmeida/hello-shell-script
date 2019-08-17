#!/bin/bash

#############################################################
#                                                           #
# Name: list-users.sh                                       #
#                                                           #
# Author: Gilvan Ribeiro                                    #
# Creation date: 2019-08-17                                 #
#                                                           #
# Description: List all system (human) users                #
#              displaying key account information           #
#                                                           #
# Example of use: ./list-users.sh                           #
#                                                           #
#############################################################

# UIDs used for ordinary users

MIN_UID=$(grep "^UID_MIN" /etc/login.defs | tr -s "\t" | cut -f2)
MAX_UID=$(grep "^UID_MAX" /etc/login.defs | tr -s "\t" | cut -f2)

OLD_IFS=$IFS
IFS=$'\n'

echo -e "USER\t\tUID\t\tHOME_DIRECTORY\t\tNAME OR DESCRIPTION"

for user in $(cat /etc/passwd)
do
  USER_ID=$(echo $user | cut -d ":" -f3)
  if [ $USER_ID -ge $MIN_UID -a $USER_ID -le $MAX_UID ]
  then
    USER=$(echo $user | cut -d ":" -f3)
    USER_DESCRIPTION=$(echo $user | cut -d ":" -f5 | tr -d ',')
    USER_HOME=$(echo $user | cut -d ":" -f6)
    echo -e "$USER\t\t$USER_ID\t\t$USER_HOME\t\t$USER_DESCRIPTION"
  fi
done

IFS=$OLD_IFS
