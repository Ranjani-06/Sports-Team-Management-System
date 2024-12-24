create database sports;
use sports;

create table football (
    team_id int primary key auto_increment,
    team_name varchar(100),
    league_id int
);

create table players (
    player_id int primary key auto_increment,
    player_name varchar(100),
    team_id int,
    position varchar(50),
    age int,
    foreign key (team_id) references football(team_id)
);

create table matches (
    match_id int primary key auto_increment,
    home_team_id int,
    away_team_id int,
    match_date date,
    foreign key (home_team_id) references football(team_id),
    foreign key (away_team_id) references football(team_id)
);

create table scores (
    match_id int,
    home_team_score int,
    away_team_score int,
    primary key (match_id),
    foreign key (match_id) references matches(match_id)
);

create table leagues (
    league_id int primary key auto_increment,
    league_name varchar(100)
);

insert into football (team_name, league_id) values
('real madrid', 1),
('real madrid', 2),
('juventus', 3),
('barcelona', 2),
('bayern munich', 1);

insert into players (player_name, team_id, position, age) values
('cristiano ronaldo', 1, 'forward', 39),
('lionel messi', 2, 'forward', 36),
('neymar', 3, 'forward', 32),
('sergio ramos', 1, 'defender', 38),
('gerard pique', 4, 'defender', 37);

insert into matches (home_team_id, away_team_id, match_date) values
(1, 2, '2024-12-19'),
(3, 4, '2024-12-20'),
(5, 1, '2024-12-21');

insert into scores (match_id, home_team_score, away_team_score) values
(1, 2, 1),
(2, 1, 1),
(3, 3, 2);

insert into leagues (league_name) values
('premier league'),
('la liga'),
('serie a');

-- query to get players with their teams
select players.player_name, players.position, football.team_name
from players
join football on players.team_id = football.team_id;

-- query to find the team with the highest total score in a match
select team_name
from football
where team_id = (
    select home_team_id
    from matches
    join scores on matches.match_id = scores.match_id
    where scores.home_team_score + scores.away_team_score = (
        select max(scores.home_team_score + scores.away_team_score)
        from scores
    )
);

-- creating a procedure to get player count per team
delimiter //
create procedure getplayercountperteam()
begin
    select football.team_name, count(players.player_id) as player_count
    from football
    left join players on football.team_id = players.team_id
    group by football.team_id;
end //
delimiter ;
call getplayercountperteam();

-- alter players table to add age column
alter table players add column age int;

-- updating position for lionel messi
update players
set position = 'defender'
where player_name = 'lionel messi';