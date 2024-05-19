#!/bin/bash

# Generate random number between 1 and 1000
random_number=$(( $RANDOM % 1000 + 1 ))

# Prompt user for username:
echo "Enter your username:"
read username

# Search user in database

# If the user is a returning player output greeting 1

# Else (user is a new player), output greeting 2
 # Insert player into database

# Prompt user for guess in this current game:

# Check if guess is numeric
# If number is not numeric, ask for another guess

# Otherwise continue with numeric comparison
  # If number is less than guess, ask for another guess

  # Else if number is greater than guess, ask for another guess

  # Otherwise number is a match,
  # Congratulate player and finish running
