CREATE DATABASE Accounts;

CREATE TABLE endUsers
(
	uid int,
	username varchar(32),
    password varchar(32),
    email varchar(64),
    phone varchar(32),
    isSeller bool,
    lastAccessed datetime,
    isActive bool,
    PRIMARY KEY(uid)
);

INSERT INTO endUsers
VALUES (1, 'Admin', 'root', 'Admin@gmail.com', '6090001111', true, '2001-01-01 00:00:00', true);

SELECT * FROM endUsers;

select count(*) from endUsers;