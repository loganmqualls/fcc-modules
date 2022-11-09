#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# #Truncate tables
# TRUNCATE="$($PSQL "TRUNCATE games, teams")"

echo "Running script..."

#Insert team data
cat games.csv | while IFS="," read YR RND WIN OPP WIN_G OPP_G
do

  #For every line except the titles line...
  if [[ $WIN != "winner" ]]
  then
    WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WIN'")

    #If the winner's id is not already in the table...
    if [[ -z $WIN_ID ]]
    then
      INSERT_WIN=$($PSQL "INSERT INTO teams(name) VALUES('$WIN')")
      WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WIN'")
    fi

    #If the opponent's id is not already in the table...
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'")
    if [[ -z $OPP_ID ]]
    then
      INSERT_OPP=$($PSQL "INSERT INTO teams(name) VALUES('$OPP')")
      OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'")
    fi

    #See if that game has already been added using year, winner, and opponent group
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YR' AND (winner_id='$WIN_ID' AND opponent_id='$OPP_ID')")

    #If the game is not already in the table...
    if [[ -z $GAME_ID ]]
    then

      # year,round,winner,opponent,winner_goals,opponent_goals
      INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
                            VALUES($YR, '$RND', $WIN_ID, $OPP_ID, $WIN_G, $OPP_G)")


    fi


  fi
done
echo "Script complete."
