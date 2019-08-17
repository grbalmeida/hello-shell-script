#!/bin/bash

for file in files/*
do
  if [ -f $i ]
  then
    echo "Checking the file $file"
    NUMBER_OF_LINES=$(cat $file | wc -l)
    NUMBER_OF_WORDS=$(cat $file | wc -w)
    echo "The file $file contains $NUMBER_OF_LINES lines."
    echo "The file $file contains $NUMBER_OF_WORDS words."
    echo
  fi
done
