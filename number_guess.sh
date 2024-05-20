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

guess() {
  guess_count=$(( $1 + 1 ))

  # Prompt user for guess in this current game:
  echo "Guess the secret number between 1 and 1000:"
  read guess

  # Check if guess is numeric
  # If number is not numeric, ask for another guess
  if [[ ! $guess =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    guess $guess_count

  # Otherwise continue with numeric comparison
  else
    # If number is less than guess, ask for another guess
    if [[ $random_number -lt $guess ]]
    then
      echo "It's lower than that, guess again:"
      guess $guess_count
    # Else if number is greater than guess, ask for another guess
    elif [[ $random_number -gt $guess ]]
    then
      echo "It's higher than that, guess again:"
      guess $guess_count
    # Otherwise number is a match,
    else
    # Congratulate player and finish running
      echo You guessed it in $guess_count tries. The secret number was $random_number. Nice job!

      # Update Stats
      user_results=$($PSQL "SELECT username, games_played, best_game FROM user_stats WHERE username='$username';")
      echo $user_results | while IFS='|' read username games_played best_game
      do
        games_count=$(( $games_played + 1 ))
        games_played_update_result=$($PSQL "UPDATE user_stats SET games_played=$games_count WHERE username='$username';")
        if [[ -z $best_game || $guess_count -lt $best_game ]]
        then
          best_game_update_result=$($PSQL "UPDATE user_stats SET best_game=$guess_count WHERE username='$username';")
        fi
      done
    fi
  fi
}

guess 0