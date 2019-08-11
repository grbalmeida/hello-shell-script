#!/bin/bash

##########################################################
#                                                        #
# Name: backup.sh                                        #
#                                                        #
# Author: Gilvan Ribeiro                                 #
# Creation date: 2019-08-11                              #
#                                                        #
# Description: The script will make a compressed backup  #
#              of the home directory of the user running #
#              the script.                               # 
#                                                        #
# Example of use: ./backup.sh                            #
#                                                        #
##########################################################

DESTINATION_DIRECTORY=$HOME/backup

create_directory () {
  if [ ! -d $DESTINATION_DIRECTORY ]
  then
    echo "Creating directory $DESTINATION_DIRECTORY..."
    mkdir -p $DESTINATION_DIRECTORY
  fi
}

backup_already_created () {
  echo "A backup of the $HOME directory has already been generated in last days."
  echo "Do you want to continue? (Y/N): "
  read -n1 CONTINUE
  echo
}

aborted_backup () {
  echo "Aborted backup!"
  exit 1
}

invalid_option () {
  echo "Invalid option"
  exit 2
}

one_more_backup () {
  echo "One more backup will be created for the same week."
}

backup_messages () {
  DAYS7=$(find $DESTINATION_DIRECTORY -ctime -7 -name backup_home\*tgz)

  if [ "$DAYS7" ]
  then
    backup_already_created

    if [ "$CONTINUE" = N -o "$CONTINUE" = n -o "$CONTINUE" = "" ]
    then
      aborted_backup
    elif [ $CONTINUE = Y -o $CONTINUE = y ]
    then
      one_more_backup
    else
      invalid_option
    fi
  fi
}

create_backup () {
  echo "Creating backup..."
  FILE="backup_home_$(date +%Y%m%d%H%M).tgz"
  tar zcvpf $DESTINATION_DIRECTORY/$FILE --absolute-names --exclude="$HOME/Google Drive" --exclude="$HOME/Videos" --exclude="$DESTIONATION_DIRECTORY" "$HOME"/* > /dev/null
  echo
  echo "Backup name \""$FILE"\" was created at $DESTINATION_DIRECTORY"
  echo
  echo "Backup completed!"
}

create_directory
backup_messages
create_backup