--Student:		Jordan Hordyk
--Lab:			07
--Date:			10-19-2018
--Class:		CS 262
--Professor:	Keith vander Linden


-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS PlayerProperty;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY,
	color varchar(50) NOT NULL,
	name varchar(50) NOT NULL
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	money integer,
	pieceName varchar(50) NOT NULL,
	location integer
	);

CREATE TABLE PlayerPropertyGame (
	playerID integer REFERENCES Player(ID),
	propertyID integer REFERENCES Property(ID), 
	gameID integer REFERENCES Game(ID),
	numberHouses integer,
	numberHotels integer
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON PlayerPropertyGame TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO Property VALUES (1, 'Dark Blue', 'Boardwalk')
INSERT INTO Property VALUES (2, 'Dark Blue', 'Park Place')

INSERT INTO PlayerGame VALUES (1, 1, 0.00, 'Racecar', 0);
INSERT INTO PlayerGame VALUES (1, 2, 0.00, 'Tophat', 0);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 'Boat', 0);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00, 'Dat Boi', 0);
INSERT INTO PlayerGame VALUES (2, 2, 0.00, 'Vander Linden Statue', 0);
INSERT INTO PlayerGame VALUES (2, 3, 500.00, 'Norman Statue', 0);
INSERT INTO PlayerGame VALUES (3, 2, 0.00, 'Plantinga Statue', 0);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00, 'Iron', 0);

INSERT INTO PlayerPropertyGame VALUES (1, 2, 1, 0, 1)
INSERT INTO PlayerPropertyGame VALUES (2, 1, 1, 1, 0)