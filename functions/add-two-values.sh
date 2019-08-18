#!/bin/bash

addTwoValues () {
  sum=$(expr $1 + $2)
  return $sum
}

addTwoValues 10 20
thirty=$?

addTwoValues 25 18
forty_three=$?

echo $thirty
echo $forty_three
