create database quanlyluong;
use quanlyluong;
create table customers(
ID int not null auto_increment primary key,
NAME varchar(50),
AGE int,
ADDRESS varchar(100),
SALARY double
);

create table staff(
ID int not null auto_increment primary key,
NAME varchar(50),
country varchar(50)
);

SELECT * from customers
 -- where salary > 8000
--  where age > 25;
order by salary DESC;

-----------------------------------------------------------------------------------------------------
-- WHERE
-- where sử dụng trong câu lệnh truy vấn để lựa chọn các bản ghi theo nhiều điều kiện 
-- where : Lọc kết quả từ các lệnh SELECT, UPDATE hoặc DELETE
-- cú pháp : where + " Điều Kiện "
----------------------------------------------------------------------------------------------------------------
-- ORDER BY
-- order by : Sắp xếp các kết quả theo một bản ghi theo thứ tự tăng dần(ASC) hoặc giảm dần (DESC).
-- cú pháp : order by column1, column2,.... ASC| DESC;
-- order by salary desc

-----------------------------------------------------------------------------------------------------------------
-- GROUP BY
-- group by : Nhóm các kết quả truy vấn thành các nhóm tùy theo giá trị của các cột chỉ định
-- (thường được dùng kèm theo các hàm: COUNT, MAX, MIN, SUM, AVG)
-- mệnh đề group by được sử dụng kết hợp với lệnh SELECT để sắp xếp dữ liệu từ nhiều bản ghi đồng nhất vào trong các nhóm.
-- vị trí : where + "group by" + order by 
SELECT count(NAME), AGE FROM customers
group by AGE;
SELECT NAME, SUM(SALARY) FROM customers
group by NAME;
-------------------------------------------------------------------------------------------------------------------
-- HAVING
-- được sử dụng để quy định các điều kiện trong trường hợp sử dụng các hàm SQL
-- không thể sử dụng câu lệnh where.

select * from staff;
select count(ID) as customerCount, country
from staff
group by country ;
-- having customerCount > 1; 










