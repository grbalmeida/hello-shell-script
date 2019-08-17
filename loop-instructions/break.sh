#!/bin/bash

read -p "What is the best country to live in? " BEST_COUNTRY

for country in $(cat files/countries.txt)
do
  if [ $country = $BEST_COUNTRY ]
  then
    echo "The best country to live in is $BEST_COUNTRY"
    break
  fi
  echo "Country: $country"
done
