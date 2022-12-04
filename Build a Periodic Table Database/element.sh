#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
RESULT=""

ELEMENT_DATA() {
  if [[ $2 == "atomic_number" ]]
  then
    RESULT=$($PSQL "SELECT * FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE $2=$1;")
  else
    RESULT=$($PSQL "SELECT * FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE $2='$1';")
  fi
  if [[ ! -z $RESULT ]]
  then
    echo "$RESULT" | while read TYPE_ID BAR AT_NUM BAR SYMBOL BAR NAME BAR AT_MASS BAR M_P_C BAR B_P_C BAR TYPE
    do
      echo "The element with atomic number $AT_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $AT_MASS amu. $NAME has a melting point of $M_P_C celsius and a boiling point of $B_P_C celsius."
    done
  fi
}

if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]*$ ]]
  then
    ELEMENT_DATA $1 "atomic_number"
  else
    ELEMENT_DATA $1 "name"
    if [[ -z $RESULT ]]
    then
      ELEMENT_DATA $1 "symbol"
    fi
  fi

  if [[ -z $RESULT ]]
  then
    echo "I could not find that element in the database."
  fi
else
  echo "Please provide an element as an argument."
fi
