#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

DISPLAY () {
  echo -e "\n~~~~~ Number Guessing Game ~~~~~\n" 
  echo "Enter your username:"
  read USERNAME

  # maximum random number range
  RANDOM_NUMBER=$((1 + $RANDOM % 100))
  NUMBER_OF_GUESSES=0

  USER_ID=$($PSQL "SELECT u_id FROM users WHERE name='$USERNAME';")

  if [[ -z $USER_ID ]]
  then
    
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

    INSERTED_TO_USERS=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME');")

    echo -e "\nGuess the secret number between 1 and 1000: "
    
    read GUESS
    GUESS_FUNCTION $GUESS
    
    USER_ID=$($PSQL "SELECT u_id FROM users WHERE name='$USERNAME';")
    INSERTED_TO_GAMES=$($PSQL "INSERT INTO games(u_id, n_guesses) values($USER_ID, $NUMBER_OF_GUESSES)")

  else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(u_id) FROM games WHERE u_id='$USER_ID'")

    BEST_GUESS=$($PSQL "SELECT MIN(n_guesses) FROM games WHERE u_id='$USER_ID'")

    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
    
    echo -e "\nGuess the secret number between 1 and 1000: "
    read GUESS
    GUESS_FUNCTION $GUESS

    INSERTED_TO_GAMES=$($PSQL "INSERT INTO games(u_id, n_guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")  
  fi
}


GUESS_FUNCTION () { 
  if ! [[ $1 =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    read GUESS
    GUESS_FUNCTION $GUESS
  elif [ $1 -gt $RANDOM_NUMBER ]
  then
    echo -e "\nIt's lower than that, guess again:"
    read GUESS
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
    GUESS_FUNCTION $GUESS
  elif [ $1 -lt $RANDOM_NUMBER ]
  then 
    echo -e "\nIt's higher than that, guess again:"
    read GUESS
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
    GUESS_FUNCTION $GUESS
  elif [ $1 = $RANDOM_NUMBER ]
  then
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
    echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  fi
}

DISPLAY
