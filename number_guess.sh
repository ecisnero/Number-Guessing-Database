#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate random number between 1 and 1000
random_number=$(( $RANDOM % 1000 + 1 ))

# Prompt user for username:
echo "Enter your username:"
read username

# Search user in database
user_results=$($PSQL "SELECT username, games_played, best_game FROM user_stats WHERE username='$username';")

# If the user is a returning player output greeting 1
if [[ $user_results ]]
then
  echo $user_results | while IFS='|' read username games_played best_game
  do
    echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
  done
# Else (user is a new player), output greeting 2
else
 # Insert player into database
  test=$($PSQL "INSERT INTO user_stats(username) VALUES('$username');")
  echo "Welcome, $username! It looks like this is your first time here."
fi
# Prompt user for guess in this current game:

# Check if guess is numeric
# If number is not numeric, ask for another guess

# Otherwise continue with numeric comparison
  # If number is less than guess, ask for another guess

  # Else if number is greater than guess, ask for another guess

  # Otherwise number is a match,
  # Congratulate player and finish running
