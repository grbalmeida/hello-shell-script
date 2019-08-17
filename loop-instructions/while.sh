#!/bin/bash

clear
read -p "Enter process limit: " MAXIMUM

while [ $(ps axu | wc -l) -le $MAXIMUM ]
do
  echo "Everything is OK"
  echo "Current processes: $(ps axu | wc -l)"
  sleep 3
  echo
done

echo "Process limit exceeded"
echo "Please check the system"
