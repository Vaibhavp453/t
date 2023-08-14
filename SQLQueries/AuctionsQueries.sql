CREATE DATABASE IF NOT EXISTS Auctions;
USE Auctions;

create table IF NOT EXISTS Auctions
(
	id int not null,
    itemID int not null references Items.items,
    sellerUN varchar(32) not null,
    hasReserve boolean not null,
    reserveAmount float,
    expires datetime,
	isActive boolean not null,
    PRIMARY KEY(id)
);

create table bid 
(
	id int not null auto_increment, 
    item_id int not null, 
    user_id varchar(256) not null, 
    timestamp datetime not null, 
    bid decimal(15,2) not null, 
    max_bid decimal(15,2) null, 
    primary key (id)
);

