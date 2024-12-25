# Sports-Team-Management-System
Descrition:
This repository contains a SQL script for creating and manipulating a sports database, focusing on football (soccer). The script includes tables for teams, players, matches, scores, and leagues, along with queries and stored procedures for data retrieval and manipulation.

Technologies Used:
 MySQL 

  Table used:
1.football: Contains information about football teams.
    - team_id (INT, Primary Key, Auto Increment): Unique identifier for each team.
    - team_name (VARCHAR(100)): The name of the team.
    - league_id (INT, Foreign Key): The ID of the league in which the team plays.

2. players: Contains information about football players.
    - player_id (INT, Primary Key, Auto Increment): Unique identifier for each player.
    - player_name (VARCHAR(100)): The name of the player.
    - team_id (INT, Foreign Key): The team the player is associated with.
    - position (VARCHAR(50)): The player's position (e.g., Forward, Defender).
    - age (INT): The age of the player.
    - 
3.matches: Contains information about football matches.
    - match_id (INT, Primary Key, Auto Increment): Unique identifier for each match.
    - home_team_id (INT, Foreign Key): The team playing at home.
    - away_team_id (INT, Foreign Key): The team playing away.
    - match_date (DATE): The date of the match.

4. scores: Contains the scores of football matches.
    - match_id (INT, Primary Key, Foreign Key): The match ID.
    - home_team_score (INT): The score of the home team.
    - away_team_score (INT): The score of the away team.

5. leagues: Contains information about football leagues.
    - league_id (INT, Primary Key, Auto Increment): Unique identifier for each league.
    - league_name (VARCHAR(100)): The name of the league.

SQL Operations:
  Query 1: List of Players and Their Teams**  
    Retrieves all players along with their positions and associated teams.

  Query 2: Team with Highest Total Score in a Match
    Finds the team that scored the highest total score in any match (home + away score).

  Stored Procedure: Get Player Count per Team
    A stored procedure that returns the number of players in each football team.

  Alter Table: Adds an 'age' column to the 'players' table.
Update Player Position: Updates the position of a player, for example, changing Lionel Messi's position to "Defender".

Conclusion:
This sports database project provides a comprehensive structure for managing football-related data, including teams, players, matches, scores, and leagues. The database schema is designed to efficiently store and retrieve information about teams, players, match results, and league standings. Through the use of SQL queries and stored procedures, users can perform various data analysis tasks such as tracking player details, analyzing team performance, and exploring match statistics.







