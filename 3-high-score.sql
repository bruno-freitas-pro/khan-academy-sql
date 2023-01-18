/* What does the app's SQL look like? */

CREATE TABLE scores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    player TEXT,
    high_score INTEGER
    );

INSERT INTO scores (player, high_score)
    VALUES ("Bruno",1000);
INSERT INTO scores (player, high_score)
    VALUES ("Juca",2000);
INSERT INTO scores (player, high_score)
    VALUES ("Elizeu",3000);    
INSERT INTO scores (player, high_score)
    VALUES ("Rodrigo",6000);    
INSERT INTO scores (player, high_score)
    VALUES ("Fabio",5000);    

SELECT * FROM scores
ORDER BY high_score DESC;

BEGIN TRANSACTION;
    UPDATE scores SET player = "Isa"
        WHERE high_score = (
        SELECT high_score FROM scores ORDER BY high_score ASC LIMIT 1
        );
    UPDATE scores SET high_score = "6000"
        WHERE high_score = (
        SELECT high_score FROM scores ORDER BY high_score ASC LIMIT 1
        );
COMMIT;

SELECT * FROM scores
        ORDER BY high_score DESC;

DELETE FROM scores
    WHERE high_score NOT IN (
    SELECT high_score FROM scores
        ORDER BY high_score DESC LIMIT 3);

SELECT * FROM scores ORDER BY high_score DESC;
