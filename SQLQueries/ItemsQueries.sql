CREATE DATABASE Items;
USE Items;

CREATE TABLE Items
(
	name varchar(256),
    itemType int 
)

INSERT INTO Items 
values("CAR", 1);

SELECT * FROM Items WHERE UPPER(name) LIKE "%RED%" OR UPPER(name) LIKE "%CAR%" OR UPPER(name) LIKE "%AND%" OR UPPER(name) LIKE "%TOOTHPASTE%" 