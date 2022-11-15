create database quanlybanhang;
use quanlybanhang;

create table customer(
cID int not null primary key,
cName varchar(50) not null,
cAge int 
);

create table orders(
oID int not null primary key,
cID int not null,
oDate Datetime,
oTotalPrice int not null,
foreign key (cID) references customer (cID)
);

create table product(
pID int not null primary key,
pName varchar(50),
pPrice double
);

create table orderdetail(
oID int not null,
pID int not null,
odQTY int not null,
foreign key (oID) references orders (oID),
foreign key (pID) references product (pID)
);
