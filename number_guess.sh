#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "\n~~~Welcome to number guessing game~~~\n"

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
 IFS= "|" read GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
 echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
 fi

#Function to generate a random number and handle guessing


