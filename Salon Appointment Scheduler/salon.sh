#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

RETURN_OPTIONS() {
  SERVICES=$($PSQL "SELECT * FROM services;")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
}

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi

  RETURN_OPTIONS
  read SERVICE_ID_SELECTED
  if [[ -z $SERVICE_ID_SELECTED || ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "Please, enter a valid option"
  else
    SERVICE_SEARCH_RESULT=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
    if [[ -z $SERVICE_SEARCH_RESULT ]]
    then
      MAIN_MENU "Please, enter a valid option"
    else
      echo -e "\nPlease, enter your phone number:"
      read CUSTOMER_PHONE
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
      if [[ -z $CUSTOMER_ID ]]
      then
        echo -e "\nPlease, enter your name:"
        read CUSTOMER_NAME
        NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME';")
      fi
      echo -e "\nPlease, enter the time of the appointment:"
      read SERVICE_TIME
      NEW_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")
      echo "I have put you down for a $SERVICE_SEARCH_RESULT at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

MAIN_MENU