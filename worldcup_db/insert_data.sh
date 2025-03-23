#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
$PSQL "TRUNCATE TABLE teams, games;"

while IFS=, read -r year round winner opponent winner_goals opponent_goals
do 
  echo "I got $winner, $opponent";
  CHECK_NAME_WINNER=$($PSQL "SELECT name FROM teams WHERE name = '$winner';")
  CHECK_NAME_OPPONENT=$($PSQL "SELECT name FROM teams WHERE name = '$opponent';")
  if [[ ! $CHECK_NAME_WINNER ]]
  then
    $PSQL "INSERT INTO teams(name) VALUES('$winner');"
    echo -e "  Inserting $winner into teams";
  elif [[ ! $CHECK_NAME_OPPONENT ]]
  then
    $PSQL "INSERT INTO teams(name) VALUES('$opponent');"
    echo -e "  Inserting $opponent into teams";
  elif [[ ! $CHECK_NAME_OPPONENT && ! $CHECK_NAME_WINNER ]]
  then 
    $PSQL "INSERT INTO teams(name) VALUES('$opponent');"
    $PSQL "INSERT INTO teams(name) VALUES('$winner');"
    echo -e "  Inserting $opponent and $winner into teams";
  fi
done < <(tail -n +2 games.csv)
while IFS=, read -r year round winner opponent winner_goals opponent_goals
do
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent';")
  $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$year', '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals);"
  echo -e "  Inserting '$year', '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals into games";
done < <(tail -n +2 games.csv)
