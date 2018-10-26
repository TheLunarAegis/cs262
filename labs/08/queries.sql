--Student:		Jordan Hordyk
--Lab:			08
--Date:			10-26-2018
--Class:		CS 262
--Professor:	Keith vander Linden



-- 8.1a
select * from Game
order by time desc;

-- 8.1b
select * from Game
where DATE_PART('day', NOW() - time) < 7;

-- 8.1c
select * from Player
where name is not null;

-- 8.1d
select distinct playerID from PlayerGame
where score > 2000;

-- 8.1e
select * from Player
where emailAddress like '%gmail.edu';

-- 8.2a
select score from PlayerGame inner join Player
on PlayerGame.playerID = Player.ID
where name = 'The King';

-- 8.2b
select name from Player inner join PlayerGame
on Player.ID = PlayerGame.playerID inner join Game
on Game.ID = PlayerGame.gameID
and score = (select max(score) from PlayerGame 
             where gameID = (select ID from Game 
                             where time = '2006-06-28 13:20:00'));

-- Referenced code from:
-- Ty Vredeveld and Quentin Barnes

--8.2c
--	Verifies that player 1 is not player 2, by seeing if one id is larger than the other
							 
--8.2d
--	a list of people who work as a team and report to eachother.
--	example: our 262 project groups