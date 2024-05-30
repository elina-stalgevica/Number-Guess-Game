#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n~~~ Welcome to the number guessing game ~~~\n"

# Prompt for username
echo "Enter your username:"
read USERNAME

# Search for username
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME';")

#Check if user exists
if [[ -z $USER_INFO ]]
then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
 
  #Insert new user into database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME');")
  GAMES_PLAYED=0
  BEST_GAME=""

else
  # Existing user
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Prompt for guess
echo "Guess the secret number between 1 and 1000:"
read INPUT  # Wait for user input

#Function to generate a random number and handle guessing
generate_number() {
  TARGET=$(( RANDOM % 1000 + 1 ))

  GUESSES=0
  while true
  do
    (( GUESSES++ ))

    if [[ ! $INPUT =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
    elif (( INPUT < TARGET ))
    then
      echo "It's higher than that, guess again:"
    elif (( INPUT > TARGET ))
    then
      echo "It's lower than that, guess again:"
    else
      echo "You guessed it in $GUESSES tries. The secret number was $TARGET. Nice job!"
      break
    fi

    read INPUT  # Prompt user for next guess
  done

  # Update user stats in the database
  (( GAMES_PLAYED++ ))

  if [[ -z $BEST_GAME || $GUESSES -lt $BEST_GAME ]]
  then
    BEST_GAME=$GUESSES
  fi

  # Update user data in the database
  if [[ $BEST_GAME == "NULL" ]]
  then
    UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=NULL WHERE username='$USERNAME';")
  else
    UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME';")
  fi
}

# Start the game
generate_number
