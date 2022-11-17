insert into product (IdProduct, code, name, price, DateProduct, amount)
values (1,'01','Macan',5000.00, current_time, 50),
		(2,'02','Taycan',7000.00, '2022-11-17', 50),
        (3,'03','Cayenne',9000.00, '2022-11-15', 30),
        (4,'04','911',100000.00, '2022-11-11', 20),
        (5,'05','Panamera',15000.00, '2022-11-9', 10);
        select * from product
        where amount >= All(select amount from product);
-------------------------------------------------------------------------------------
insert into customer (IdUser, name, age, address)
values  (1,'Minh',24, 'HaNoi'),
		(2,'Alex',25, 'USA'),
		(3,'Adam',26, 'Canada'),
		(4,'Chris',27, 'USA'),
		(5,'Eva',28, 'Korea');
        select * from customer;
---------------------------------------------------------------------------------
insert into orders(IdOrder,dateOrder,IdUser) 
values  (1,"2022-11-17",1),
		(2,"2022-11-15",2),
		(3,"2022-11-12",3),
		(4,"2022-11-11",4),
		(5,"2022-11-9",5);
        select * from orders;
---------------------------------------------------------------------------------
insert into orderdetail(IdOrder, IdProduct, quantity) 
values  (1,1,5),
		(2,2,10),
		(3,3,10),
		(4,4,12),
		(5,5,6);
        select * from orderdetail;
----------------------------------------------------------------------------------------------------------
	