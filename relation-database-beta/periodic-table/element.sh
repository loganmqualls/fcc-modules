#!/bin/bash

#query initialization var
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

#if no information about the element passed in...
if [[ -z $1 ]]
#then tell them to provide element information
then
  echo "Please provide an element as an argument."
#if there was information about the element passed in...
else
  #check the type of information passed in
  case "$1" in
    #if it is a number, check for matching info in atomic_number column
    [0-9]*) ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1") ;;
    #if it is a strong, check for matching info in name or symbol column
    *) ELEMENT=$($PSQL "SELECT * FROM elements WHERE name='$1' OR symbol='$1'") ;;
  esac
  #if no information was found on the provided element...
  if [[ -z $ELEMENT  ]]
  #then tell them that
  then
    echo "I could not find that element in the database."
  #but if information WAS found on the provided element...
  else
    #read that information into some variables
    echo $ELEMENT | while read NUMBER BAR SYMBOL BAR NAME
    do
      #use atomic_number variable (NUMBER) to get element property data
      PROPS=$($PSQL "SELECT * FROM properties WHERE atomic_number = $NUMBER")
      #read in more variables
      echo $PROPS | while read X BAR TYPE_ID BAR MASS BAR MELT BAR BOIL
      do
      #retrieve type from type_id var
      TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")
      #finally, print that information
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius." | sed 's/  / /g'
      done
    done
  fi
fi
