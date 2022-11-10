#!/bin/bash

# Var for query init
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate random number between 1-100
GOAL=$(( RANDOM % 1000 + 1 ))

# Function to greet and gather info on user
GREET() {
  # Prompt for username
  echo "Enter your username:"
  read RESPONSE

  # Check for username and user_id in DB
  USERNAME=$($PSQL "SELECT username FROM users WHERE username = '$RESPONSE'")
  USERID=$($PSQL "SELECT user_id FROM users WHERE username = '$RESPONSE'")

  # If not found
  if [[ -z $USERNAME ]]
  then
    # Add the new user, retrieve username and user_id, and greet them
    ADD_USER=$($PSQL "INSERT INTO users(username) VALUES('$RESPONSE')")
    USERNAME=$RESPONSE
    USERID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    # If the user is found, greet them and show them their stats
    NUM_GAMES=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USERID")
    BEST_GUESS_NUM=$($PSQL "SELECT MIN(num_guess) FROM games WHERE user_id=$USERID")
    echo "Welcome back, $USERNAME! You have played $NUM_GAMES games, and your best game took $BEST_GUESS_NUM guesses." | sed 's/  */ /g'
  fi

}

# Function for the game portion
GAME() {

  # Read in user guess
  read GUESS

  # Add 1 to num_guesses for every guess to keep track
  NUM_GUESSES=$((NUM_GUESSES+1))

  # If that guess if not a number
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    # Still counted as guess, warning message, go to top of GAME
    echo 'That is not an integer, guess again:'
    GAME
  else
    # If the guess is a number, is it greater than the goal? 
    if [[ $GUESS -gt $GOAL ]]
    then
      # Tell them
      echo "It's lower than that, guess again:"
      GAME
    # Is it less than the goal?
    elif [[ $GUESS -lt $GOAL ]]
    then
      # Tell them
      echo "It's higher than that, guess again:"
      GAME
    # Is the guess equal to the goal?
    elif [[ $GUESS -eq $GOAL ]]
    then 
      # Tell them!
      echo "You guessed it in $NUM_GUESSES tries. The secret number was $GOAL. Nice job!"
    fi
  fi
  
}

# Run greet
GREET
# Initiate num_guesses
NUM_GUESSES=0
# Prompt for guesses
echo "Guess the secret number between 1 and 1000:"
# Call game (as many times as necessary)
GAME

# One complete, send game info to DB
LOG_GAME=$($PSQL "INSERT INTO games(user_id, num_guess) VALUES($USERID,$NUM_GUESSES)")
