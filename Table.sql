use quanlyhang;
create table product(
IdProduct int not null  primary key,
code varchar(50) not null unique,
name varchar(50),
price double,
DateProduct date,
amount int
);

create table customer(
IdUser int not null primary key,
name varchar(50),
age int check (age > 0 and age < 120),
address varchar(50)
);

create table orders(
IdOrder int not null primary key,
dateOrder date,
IdUser int not null,
foreign key (IdUser) references customer (IdUser)
);

create table orderdetail(
IdOrder int not null,
IdProduct int not null,
quantity int,
foreign key (IdOrder) references orders (IdOrder),
foreign key (IdProduct) references product (IdProduct)
);




