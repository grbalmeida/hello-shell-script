#!/bin/bash

uppercase () {
  echo $1 | tr a-z A-Z
}

lowercase () {
  echo $1 | tr A-Z a-z
}

lowercaseWithGlobal () {
  GLOBAL_UPPERCASE=$(echo $1 | tr A-Z a-z)
}

lowercaseWithLocal () {
  local LOCAL_UPPERCASE=$(echo $1 | tr A-Z a-z)
}

SHELL=$(uppercase shell)
shell=$(lowercase SHELL)
lowercaseWithGlobal GLOBAL
lowercaseWithLocal LOCAL

echo $SHELL
echo $shell
echo $GLOBAL_UPPERCASE
echo $LOCAL_UPPERCASE
