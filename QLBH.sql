create database  StudentManagement;
use StudentManagement;

create table customer(
    cID int not null auto_increment primary key,
    name varchar(25),
    cAge tinyint
);

create table orders(
    oID int not null auto_increment primary key ,
    cID int not null,
    oDate date,
    oTotalPrice int,
    foreign key (cID) references customer (cID)
);

create table product(
    pID int not null auto_increment primary key ,
    pName varchar(25),
    pPrice int
);

create table orderDetail(
    oID int,
    pID int,
    odQTY int,
    foreign key (oID) references orders (oID),
    foreign key (pID) references product (pID)
);

select * from customer;
select * from product;
select * from orders;
select * from orderDetail;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select orders.oId, c.Name, orders.oDate, orderDetail.odQTY, product.pName, product.pPrice, sum(orderDetail.odQTY * product.pPrice) as TotalPrice
from orders
join orderDetail on orders.oID = orderDetail.oID
join product on orderdetail.pID = product.pID
join customer c on orders.cID = c.cID
group by orders.oId, c.Name, orders.oDate, orderDetail.odQTY, product.pName, product.pPrice;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select * from customer
    where not exists(select * from orders where orders.cID = customer.cID);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)










