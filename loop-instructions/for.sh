#!/bin/bash

clear
read -p "Enter start of sequence: " START
read -p "Enter end of sequence: " END

for value in $(seq $START $END)
do
  echo "Displaying the value $value"
done
