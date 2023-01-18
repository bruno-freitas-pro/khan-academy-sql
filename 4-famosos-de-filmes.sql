/* Create table about the people and what they do here */

/* Data Source: http://www.celebritizer.com/ */

CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  job TEXT);

INSERT INTO actors (name, job) VALUES ("Denzel Washington", "actor");
INSERT INTO actors (name, job) VALUES ("Morgan Freeman", "actor");
INSERT INTO actors (name, job) VALUES ("Julia Roberts", "actress");
INSERT INTO actors (name, job) VALUES ("Bruce Willis", "actor");
INSERT INTO actors (name, job) VALUES ("Keanu Reeves", "actor");
INSERT INTO actors (name, job) VALUES ("Sandra Bullock", "actress");
INSERT INTO actors (name, job) VALUES ("Robert Downey Jr.", "actor");

CREATE TABLE movies(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  actor_1 INTEGER,
  actor_2 INTEGER);

INSERT INTO movies (name, actor_1, actor_2) VALUES ("Glory", 1, 2);
INSERT INTO movies (name, actor_1, actor_2) VALUES ("The Siege", 1, 4);
INSERT INTO movies (name, actor_1, actor_2) VALUES ("Much Ado About Nothing", 1, 5);
INSERT INTO movies (name, actor_1, actor_2) VALUES ("The Pelican Brief", 1, 3);
INSERT INTO movies (name, actor_1, actor_2) VALUES ("Red", 2, 4);
INSERT INTO movies (name, actor_1, actor_2) VALUES ("Lucky Number Slevin", 2, 4);
INSERT INTO movies (name, actor_1, actor_2) VALUES ("The Bonfire of the Vanities", 2, 4);
INSERT INTO movies (name, actor_1, actor_2) VALUES ("Chain Reaction", 2, 5);
INSERT INTO movies (name, actor_1, actor_2) VALUES ("Ocean's Twelve", 3, 4);
INSERT INTO movies (name, actor_1, actor_2) VALUES ("Grand Champion", 3, 4);
INSERT INTO movies (name, actor_1, actor_2) VALUES ("That's Adequate", 4, 7);
INSERT INTO movies (name, actor_1, actor_2) VALUES ("The Lake House", 5, 6);
INSERT INTO movies (name, actor_1, actor_2) VALUES ("Speed", 5, 6);
INSERT INTO movies (name, actor_1, actor_2) VALUES ("A Scanner Darkly", 5, 7);

SELECT * FROM actors;

SELECT movies.name, a.name, b.name FROM movies
    JOIN actors a
    ON movies.actor_1 = a.id
    JOIN actors b
    ON movies.actor_2 = b.id;
