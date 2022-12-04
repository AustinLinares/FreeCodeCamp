#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

ELEMENTS=$($PSQL "SELECT * FROM elements;")
echo "$ELEMENTS" | while read ATOMIC_N BAR SYMBOL BAR NAME
do
  echo $SYMBOL
  CAPITALIZED="${SYMBOL^}"
  echo "$CAPITALIZED"
  RESULT=$($PSQL "UPDATE elements SET symbol='$CAPITALIZED' WHERE atomic_number=$ATOMIC_N;")
  echo $RESULT
  echo " "
done