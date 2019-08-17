#!/bin/bash

######################################################
#                                                    #
# Name: home-inspects.sh                             #
# Creation date: 2019-08-17                          #
#                                                    #
# Description: Inspects users home directories       #
#              for files of certain extensions       #
#                                                    #
# Example of use: home-inspects.sh                   #
#                                                    #
######################################################

# Files of type: .mp4 and .mp3 and .jpg

for user in /home/*
do
  MP4COUNT=0
  MP3COUNT=0
  JPGCOUNT=0
  OLD_IFS=$IFS
  IFS=$'\n'
  
  for files in $(find $user -name '*.jpg' -o -name '*.mp4' -o -name '*.mp3')
    do
      case $files in
        *.mp4)
          MP4COUNT=$(expr $MP4COUNT + 1)
	  ;;
        *.mp3)
          MP3COUNT=$(expr $MP3COUNT + 1)
	  ;;
        *.jpg)
          JPGCOUNT=$(expr $JPGCOUNT + 1)
	  ;;
      esac
    done
  echo "User: $(basename $user)"
  echo "JPG files: $JPGCOUNT"
  echo "MP3 files: $MP3COUNT"
  echo "MP4 files: $MP4COUNT"
  echo
done

IFS=$OLD_IFS
