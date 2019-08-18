#!/bin/bash

#####################################################################
#                                                                   #
# Name: miscellaneous-functions.sh                                  #
# Creation date: 2019-08-17                                         #
#                                                                   #
# Description: Multiple-function script that handles dates          #
#                                                                   #
# Example of use: ./miscellaneous-functions.sh --help               #
#                 ./miscellaneous-functions.sh OPTION DATE          #
#                                                                   #
# Options:                                                          #
# -f = Returns 0 for BR, 1 for US, 2 when it is impossible          #
#      to dermine and 3 for invalid date format                     #
# -i = Converts BR to US format and US to BR. Include slash         #
# -b = Includes date slash. Example: from 13081981 to 13/08/1981    #
# -e = Displays the date in large format. Example: from 13081981    #
#      to 13 de Agosto de 1981                                      #
#                                                                   #
#####################################################################

DATE=$(echo $2 | tr -d "/")
FIRST_VALUE=$(echo $DATE | cut -c-2)
SECOND_VALUE=$(echo $DATE | cut -c3-4)
YEAR=$(echo $DATE | cut -c5-8)

returnsFormat () {
  # Function returns 0 for date in BR format (DDMMYYYY)
  # 1 for US format (MMDDYYYY)
  # and 2 when it is impossible to determine. When day = month is considered in BR format
  # Return 3 for invalid format

  if [ $FIRST_VALUE -le 12 -a $FIRST_VALUE -eq $SECOND_VALUE ] # Day = month = BR format
  then
    return 0
  elif [ $FIRST_VALUE -gt 12 -a $SECOND_VALUE -le 12 ] # BR format
  then
    return 0
  elif [ $FIRST_VALUE -le 12 -a $SECOND_VALUE -gt 12 ] # US format
  then
    return 1
  elif [ $FIRST_VALUE -le 12 -a $SECOND_VALUE -le 12 ]
  then
    return 2
  else
    return 3
  fi
}

invertDayMonth () {
  # Function that inverts the values of the day with month and returns the value
  
  returnsFormat $1
  local FORMAT=$?
  
  if [ $FORMAT -ne 3 ]
  then
    echo $SECOND_VALUE/$FIRST_VALUE/$YEAR
  else
    echo "Invalid date format"
  fi
}

includeSlash () {
  returnsFormat $1
  local FORMAT=$?

  if [ $FORMAT -ne 3 ]
  then
    echo "$FIRST_VALUE/$SECOND_VALUE/$YEAR"
  else
    echo "Invalid date format"
  fi
}

extendedDate () {
  # Function that includes date slash

  returnsFormat $1
  local RETURNED_FORMAT=$?
  
  case $RETURNED_FORMAT in
    0) # Date in BR format
      local DAY=$FIRST_VALUE
      local MONTH=$SECOND_VALUE
      ;;
    1) # Date in US format
      local DAY=$SECOND_VALUE
      local MONTH=$FIRST_VALUE
      ;;
    2)
      local FORMAT=0

      until [ "$FORMAT" = 1 -o "$FORMAT" = 2 ]
      do
        echo
	echo "Unable to determine date pattern"
	echo "1 - BR (DD/MM/YYYY)"
	echo "2 - US (MM/DD/YYYY)"
	read -p "Enter format (MM/DD/YYYY)" FORMAT
	
	case $FORMAT in
          1)
            local DAY=$FIRST_VALUE
	    local MONTH=$SECOND_VALUE
	    ;;
	  2)
	    local DAY=$SECOND_VALUE
	    local MONTH=$FIRST_VALUE
	    ;;
	  *)
	    echo "Invalid option"
	    ;;
	esac
      done
      echo
      ;;
    3)
      echo "Invalid date format"
      exit 3
      ;;
  esac

  case $MONTH in
    01)
      local EXTENDED_MONTH=Janeiro
      ;;
    02)
      local EXTENDED_MONTH=Fevereiro
      ;;
    03)
      local EXTENDED_MONTH=Março
      ;;
    04)
      local EXTENDED_MONTH=Abril
      ;;
    05)
      local EXTENDED_MONTH=Maio
      ;;
    06)
      local EXTENDED_MONTH=Junho
      ;;
    07)
      local EXTENDED_MONTH=Julho
      ;;
    08)
      local EXTENDED_MONTH=Agosto
      ;;
    09)
      local EXTENDED_MONTH=Setembro
      ;;
    10)
      local EXTENDED_MONTH=Outubro
      ;;
    11)
      local EXTENDED_MONTH=Novembro
      ;;
    12)
      local EXTENDED_MONTH=Dezembro
      ;;
  esac

  echo "$DAY de $EXTENDED_MONTH de $YEAR"
}

case $1 in
  "-f")
    returnsFormat $2
    echo $?
    ;;
  "-i")
    invertDayMonth $2
    ;;
  "-b")
    includeSlash $2
    ;;
  "-e")
    extendedDate $2
    ;;
  "--help")
    echo "Use $0 OPTION DATE"
    echo
    echo "DATE in DDMMYYYY or MMDDYYYY format, with or without /"
    echo
    echo "Options:"
    echo "-f = Returns 0 for BR, 1 for US, 2 when it is impossible to dermine and 3 for invalid date format"
    echo "-i = Converts BR to US format and US to BR. Include slash"
    echo "-b = Includes date slash. Example: from 13081981 to 13/08/1981"
    echo "-e = Displays the date in large format. Example: from 13081981 to 13 de Agosto de 1981"
    ;;
  *)
    echo "Misuse. Use $0 --help"
    ;;
esac
