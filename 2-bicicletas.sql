CREATE TABLE bikes (id INTEGER, brand TEXT, wheel_size TEXT, color TEXT, price INTEGER);

INSERT INTO bikes VALUES (1, "Trek", "700", "blue", 3999);
INSERT INTO bikes VALUES (2, "Caloi", "700", "brown", 2799);
INSERT INTO bikes VALUES (3, "Monark", "29", "red", 1099);
INSERT INTO bikes VALUES (4, "Caloi", "700", "magenta", 2599);
INSERT INTO bikes VALUES (5, "Cannondale", "700", "grey", 8999);
INSERT INTO bikes VALUES (6, "Specialized", "29", "grey", 6599);
INSERT INTO bikes VALUES (7, "GTS", "29", "black", 3399);
INSERT INTO bikes VALUES (8, "Cervélo", "700", "yellow", 10099);
INSERT INTO bikes VALUES (9, "Scott", "27", "green", 19999);
INSERT INTO bikes VALUES (10, "Caloi", "27", "cyan", 1999);
INSERT INTO bikes VALUES (11, "Trek", "700", "white", 4699);
INSERT INTO bikes VALUES (12, "Scott", "20", "marsala", 599);
INSERT INTO bikes VALUES (13, "Monark", "20", "navy blue", 699);
INSERT INTO bikes VALUES (14, "Caloi", "700", "orange", 999);
INSERT INTO bikes VALUES (15, "KTM", "700", "ice", 9999);

SELECT brand, wheel_size, color, price FROM bikes ORDER BY price;

SELECT brand marca, COUNT (brand) quantidade FROM bikes GROUP BY brand;
