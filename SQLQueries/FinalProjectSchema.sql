Create DATABASE IF NOT EXISTS BuyMe;
USE BuyMe;

Create TABLE IF NOT EXISTS Reports
(
	num int,
    name varchar(25),
    type varchar(25),
    #file pdf,
    primary key(num)
);

Create TABLE IF NOT EXISTS Administrator
(
	id int,
    primary key(id)
);

Create TABLE IF NOT EXISTS custRep
(
	id int,
    primary key(id)
);

Create TABLE IF NOT EXISTS endUsers
(
	uname varchar(20),
    pwd varchar(20),
    email varchar(50),
    phone varchar(15),
    primary key(uname)
);

Create TABLE IF NOT EXISTS Buyer
(
	buyerID int,
    uname varchar(20),
    primary key(buyerId,uname),
    foreign key(uname) references endUsers(uname)
);

Create TABLE IF NOT EXISTS Seller
(
	sellerID int,
    uname varchar(20),
    primary key(sellerID,uname),
    foreign key(uname) references endUsers(uname)
);

Create TABLE IF NOT EXISTS Bid
(
	bidNum int,
    amt float,
    dt date,
    tm time,
    primary key(bidNum)
);

Create TABLE IF NOT EXISTS Ask
(
	askNum int,
    amt float,
    dt date,
    tm time,
    primary key(askNum)
);
    
Create TABLE IF NOT EXISTS Item
(
	vin int,
    name varchar(25),
    make varchar(15),
    model varchar(20),
    color varchar(15),
    year year,
    PRIMARY KEY(vin)
);

Create TABLE IF NOT EXISTS Auction
(
	auctId int,
    endTime time,
    endDate date,
    isActive boolean,
    highBid float,
    primary key(auctId)
);

Create TABLE IF NOT EXISTS Car
(
	vin int,
    cid int,
    primary key(vin,cid),
    foreign key (vin) references Item(vin)
);

Create TABLE IF NOT EXISTS Motorcycle
(
	vin int,
    mid int,
    primary key(vin, mid),
    foreign key (vin) references Item(vin)
);

Create TABLE IF NOT EXISTS Truck
(
	vin int,
    tid int,
    primary key(vin,tid),
    foreign key (vin) references Item(vin)
);

Create TABLE IF NOT EXISTS formulates
(
	num int,
    id int,
    primary key(num,id),
    foreign key(num) references Reports(num),
    foreign key(id) references Administrator(id)
);

Create TABLE IF NOT EXISTS makesAcc
(
	aid int,
    cid int,
    primary key(aid,cid),
    foreign key(aid) references Administrator(id),
    foreign key(cid) references custRep(id)
);

Create TABLE IF NOT EXISTS availTo
(
	cid int,
    uname varchar(20),
    primary key(cid,uname),
    foreign key(cid) references custRep(id),
    foreign key(uname) references endUsers(uname)
);

Create TABLE IF NOT EXISTS edits
(
	auctId int,
    cid int,
    primary key(auctId, cid),
    foreign key(auctId) references Auction(auctId),
    foreign key(cid) references custRep(id)
);

Create TABLE IF NOT EXISTS isPartOf
(
	vin int,
    auctId int,
    primary key(vin,auctId),
    foreign key(vin) references Item(vin), 
    foreign key(auctId) references Auction(auctId)
);

Create TABLE IF NOT EXISTS places
(
	buyerId int,
    uname varchar(20),
    bidNum int,
    primary key(buyerId, uname, bidNum),
    foreign key(buyerId,uname) references Buyer(buyerId,uname),
    foreign key(bidNum) references Bid(bidNum)
);

Create TABLE IF NOT EXISTS puts
(
	sellerId int,
    uname varchar(20),
    askNum int,
    primary key(sellerId, uname, askNum),
    foreign key(sellerId,uname) references Seller(sellerId,uname),
    foreign key(askNum) references Ask(askNum)
);
    
Create TABLE IF NOT EXISTS bidOn
(
	bidNum int,
    vin int,
    primary key(bidNum),
    foreign key(bidNum) references Bid(bidNum),
    foreign key(vin) references Item(vin)
);

Create TABLE IF NOT EXISTS askOn
(
	askNum int,
    vin int,
    primary key(askNum),
    foreign key(askNum) references Ask(askNum),
    foreign key(vin) references Item(vin)
);

Create TABLE IF NOT EXISTS hasBidHistory
(
	auctID int,
    amount float,
    dt date,
    tm time,
    primary key(auctID), 
    foreign key(auctID) references Auction(auctID)
);