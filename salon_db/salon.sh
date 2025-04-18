#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
MAIN_MENU () {
  if [[ $1 ]]
  then 
  echo -e "\n$1"
  fi

  echo -e "\n~~~~~ MY SALON ~~~~~\n"
  echo -e "\nWelcome to My Salon, how can I help you?\n"

  SERVICE_BOOKING
}
SERVICE_BOOKING () {
  if [[ $1 ]]
  then 
    echo -e "\n$1"
  fi
  
  echo -e "\nThese are the available services:"
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services;")
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  
  echo -e "\nWhich service would you like to book?"
  read SERVICE_ID_SELECTED
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
  
  if [[ -z $SERVICE_ID ]]
  then 
    SERVICE_BOOKING "I could not find that service. What would you like today?"

  else
    echo -e "\nWhat's your phone number?" 
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
    if [[ -z $CUSTOMER_NAME ]]
    then  
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")  
    fi
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
  echo -e "\nAt what time would you like to book the $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME');")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
  fi
}
MAIN_MENU
