#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
SECRET_NUMBER=$((1 + $RANDOM % 1000))
GUESSES=0
PLAYER_DATA=''
CURRENT_PLAYER_ID=''

PLAYERS() {
  PLAYER_DATA=$($PSQL "SELECT * FROM players FULL JOIN games USING(player_id) WHERE username='$1' ORDER BY guesses LIMIT 1;")

  if [[ -z $PLAYER_DATA ]]
  then 
    RESULT=$($PSQL "INSERT INTO players(username) VALUES('$1');")
    PLAYER_DATA=$($PSQL "SELECT * FROM players WHERE username='$1';")
    echo "$PLAYER_DATA" | while read PLAYER_ID BAR USERNAME
    do
      echo "Welcome, $USERNAME! It looks like this is your first time here."
    done
  else
    GAMES_COUNT=$($PSQL "SELECT COUNT(username) FROM players FULL JOIN games USING(player_id) WHERE username='$1' GROUP BY username;")
    COUNT=$(echo $GAMES_COUNT | sed -e 's/ *//g')

    echo "$PLAYER_DATA" | while read PLAYER_ID BAR USERNAME BAR GAME_ID BAR BEST_GAME
    do
      echo "Welcome back, $USERNAME! You have played $COUNT games, and your best game took $BEST_GAME guesses."
    done
  fi
}

GAME() {
  read ATTEMPT
  GUESSES=$(($GUESSES + 1))
  if [[ ! $ATTEMPT =~ ^[0-9]*$ ]]
  then
    echo "That is not an integer, guess again:"
    GAME
  elif [[ $SECRET_NUMBER == $ATTEMPT ]]
  then
    CURRENT_ID=$($PSQL "SELECT player_id FROM players WHERE username='$NAME';")
    RESULT=$($PSQL "INSERT INTO games(guesses,player_id) VALUES($GUESSES,$CURRENT_ID);")
    echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  else
    if [[ $SECRET_NUMBER -lt $ATTEMPT ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
    GAME
  fi
}

echo "Enter your username:"
read NAME
PLAYERS $NAME
echo "Guess the secret number between 1 and 1000:"
GAME
