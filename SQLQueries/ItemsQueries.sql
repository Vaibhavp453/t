CREATE DATABASE IF NOT EXISTS Items;
USE Items;

Create TABLE IF NOT EXISTS Items
(
	id int,
    category int,
    PRIMARY KEY(id)
);

SELECT * FROM Items WHERE UPPER(name) LIKE "%RED%" OR UPPER(name) LIKE "%CAR%" OR UPPER(name) LIKE "%AND%" OR UPPER(name) LIKE "%TOOTHPASTE%" 