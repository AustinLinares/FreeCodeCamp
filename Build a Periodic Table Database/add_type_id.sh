#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

PROPERTIES=$($PSQL "SELECT * FROM properties;")
echo "$PROPERTIES" | while read ATOMIC_N BAR TYPE BAR ATOMIC_MASS BAR M_P_C BAR B_P_C
do
  echo $TYPE
  TYPE_ID=$($PSQL "SELECT type_id FROM types WHERE type='$TYPE';")
  echo $TYPE_ID 
  RESULT=$($PSQL "UPDATE properties SET type_id='$TYPE_ID' WHERE atomic_number='$ATOMIC_N';")
  echo $RESULT
done