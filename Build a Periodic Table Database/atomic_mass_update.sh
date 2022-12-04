#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

PROPERTIES=$($PSQL "SELECT * FROM properties;")
echo "$PROPERTIES" | while read AT_NUM BAR TYPE BAR AT_MASS BAR M_P_C BAR B_P_C BAR TYPE_ID
do
  NEW_NUMBER=$(echo $AT_MASS | sed -e 's/0*$//' )
  if [[ $NEW_NUMBER =~ \.$ ]]
  then
    NEW_NUMBER=$(echo $NEW_NUMBER | sed -e 's/\.//')
  fi
  echo $NEW_NUMBER
  RESULT=$($PSQL "UPDATE properties SET atomic_mass=$NEW_NUMBER WHERE atomic_number=$AT_NUM;")
  echo $RESULT
done