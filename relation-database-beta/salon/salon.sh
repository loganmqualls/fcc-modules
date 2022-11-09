#!/bin/bash

#####
#Logan Qualls
#freeCodeCamp's salon project
#REVAMP is an imaginary gothic-themed salon
#####

#make query initialization a variable
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

#do we want the appointment time overlap joke?
FUN="false"

#welcome everyone
echo -e "\n~~~ Welcome to REVAMP Salon ~~~\n"

#create main menu
MAIN_MENU() {
  #list services
  echo -e "$($PSQL "SELECT service_id||') '||name FROM services")\n" | sed 's/^ *//g' | sed 's/ *$//g'
  #prompt user for service number
  echo "Which service # are you interested in?"
  read SERVICE_ID_SELECTED

  #query for service info
  SERVICE_ID_SELECTED_CONF=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  #if no service info returned
  if [[ -z $SERVICE_ID_SELECTED_CONF ]]
  then
    #explain and go back to top of main menu
    echo -e "\nService not provided or invalid.\nPlease type one of the available service numbers and press ENTER:\n"
    MAIN_MENU
  #if service info returned
  else
    #prompt for phone number
    echo -e "\nPlease enter the a phone number associated with your account:"    
    read CUSTOMER_PHONE

    #query for customer info
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    #if no customer info returned
    if [[ -z $CUSTOMER_NAME ]]
    then
      #prompt for name
      echo -e "\nWelcome, new customer! We are excited to have you!\nTo help us better serve you, please enter your first and last name:"
      read CUSTOMER_NAME
      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    else
      #greet them
      echo -e "\nWelcome back, $CUSTOMER_NAME!\n" | sed -E 's/  / /'
    fi

    #query for customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    #if you want to start a fight
    if [[ $FUN ]]
    then
      #call schedule_time func
      SCHEDULE_TIME
    else
      #otherwise, just do the basics... like ask for what time they want to make their appt for
      echo -e "\nWhat time would you like to schedule your $SERVICE_NAME_SELECTED?" | sed -E 's/  / /g' | sed -E 's/_/ /g'
      read SERVICE_TIME

      #schedule that appt
      SCHEDULE_APPT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED_CONF, '$SERVICE_TIME')")
      echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME." | sed -E 's/  / /g' 
    fi

    #bye
    echo -e "\nThanks for stopping in for a REVAMP! See you soon!\n"

  fi
}

#if fun is true...
SCHEDULE_TIME() {
  #prompt for desired service time
  echo -e "\nWhat time would you like to schedule your $SERVICE_NAME_SELECTED?" | sed -E 's/  / /g' | sed -E 's/_/ /g'
  read SERVICE_TIME

  #see if that time is available
  TIME_AVAILABLE_RESULT=$($PSQL "SELECT appointment_id FROM appointments WHERE time = '$SERVICE_TIME'")

  #if it is
  if [[ -z $TIME_AVAILABLE_RESULT ]]
  then
    #scheudle the appointment
    SCHEDULE_APPT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED_CONF, '$SERVICE_TIME')")
    echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME." | sed -E 's/  / /g' | sed -E 's/_/ /g'
  #if it isn't
  else
    #reveal the already existing appointment holder and start a fight
    OPPONENT_NAME=$($PSQL "SELECT name FROM customers RIGHT JOIN appointments USING(customer_id) WHERE time = '$SERVICE_TIME'")
    echo -e "\nAppointment already taken by $OPPONENT_NAME.\nYou can take that up with them. Or... Try again:" | sed -E 's/  / /g' 
    SCHEDULE_TIME
  fi
}

#call main menu to kick things off
MAIN_MENU