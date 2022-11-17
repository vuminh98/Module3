-- Hiển thị sản phẩm có số lượng cao nhất (nếu có nhiều hiện tất cả).
select * from product
where amount >= All(select amount from product);
-----------------------------------------------------------------------------------------------------------
--  Hiển thị các sản phẩm theo giá giảm dần.
select * from product
order by price desc;
-----------------------------------------------------------------------------------------------------------
-- Hiển thị các sản phẩm có date_create trước ngày 15/11/2022
select * from product
where DateProduct <='2022-11-15';
-----------------------------------------------------------------------------------------------------------
-- Hiển thị tổng tiền của tất cả order và mã order tương ứng
select o.IdOrder, o.quantity, p.name, p.price, sum(o.quantity*p.price)
from orderdetail o join product p on o.IdProduct = p.IdProduct
group by o.IdOrder;






