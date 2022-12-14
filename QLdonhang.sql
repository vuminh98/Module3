CREATE DATABASE  IF NOT EXISTS `demo2006` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `demo2006`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: demo2006
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from customer;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Anh Đào',22),(2,'Sơn Đoàn',22),(3,'Hiệu Trung',22),(4,'Hùng Trần',25),(5,'Hưng Trần',25),(6,'Tiến Nguyễn',26),(7,'Thảo Phạm',16),(8,'Nguyễn Văn A',29),(9,'Nguyễn Trung Hiệu',22);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mg`
--

DROP TABLE IF EXISTS `mg`;
/*!50001 DROP VIEW IF EXISTS `mg`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mg` AS SELECT
 1 AS `id`,
 1 AS `time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mg1`
--

DROP TABLE IF EXISTS `mg1`;
/*!50001 DROP VIEW IF EXISTS `mg1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mg1` AS SELECT
 1 AS `id`,
 1 AS `time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mg2`
--

DROP TABLE IF EXISTS `mg2`;
/*!50001 DROP VIEW IF EXISTS `mg2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mg2` AS SELECT
 1 AS `id`,
 1 AS `time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mg3`
--

DROP TABLE IF EXISTS `mg3`;
/*!50001 DROP VIEW IF EXISTS `mg3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mg3` AS SELECT
 1 AS `id`,
 1 AS `time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL,
  `time` datetime DEFAULT NULL,
  `total` int DEFAULT NULL,
  `customerId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_idx` (`customerId`),
  CONSTRAINT `FK1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from `order`;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2006-06-20 00:00:00',NULL,1),(2,'2006-09-19 00:00:00',NULL,2),(3,'2006-07-19 00:00:00',NULL,2),(4,'2021-06-19 00:00:00',NULL,3),(5,'2006-10-12 00:00:00',NULL,8),(6,'2006-10-15 00:00:00',NULL,8);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderDetail`
--

DROP TABLE IF EXISTS `orderDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderDetail` (
  `orderId` int NOT NULL,
  `productId` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`orderId`,`productId`),
  KEY `Fk2_idx` (`productId`),
  CONSTRAINT `Fk` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`),
  CONSTRAINT `Fk2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from orderDetail;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderDetail`
--

LOCK TABLES `orderDetail` WRITE;
/*!40000 ALTER TABLE `orderDetail` DISABLE KEYS */;
INSERT INTO `orderDetail` VALUES (1,1,2),(1,2,1),(2,1,3),(2,3,4),(2,4,12),(2,6,1),(4,4,15),(4,5,20),(4,7,3),(5,1,15),(5,3,2),(5,4,12),(5,5,9),(6,1,1),(6,2,2),(6,3,3);
/*!40000 ALTER TABLE `orderDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select *
from product
where quantity >= 30
;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Tivi Samsung',280,10),(2,'Điều hoà Panasonic',190,8),(3,'Máy giặt apple',800,15),(4,'Tủ Lạnh',320,30),(5,'Máy Giặt',150,20),(6,'Máy tính để bàn',290,100),(7,'Máy chơi game',800,10),(8,'Máy hút bụi',290,30);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tl`
--

DROP TABLE IF EXISTS `tl`;
/*!50001 DROP VIEW IF EXISTS `tl`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tl` AS SELECT
 1 AS `id`,
 1 AS `time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tl1`
--

DROP TABLE IF EXISTS `tl1`;
/*!50001 DROP VIEW IF EXISTS `tl1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tl1` AS SELECT
 1 AS `id`,
 1 AS `time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tl3`
--

DROP TABLE IF EXISTS `tl3`;
/*!50001 DROP VIEW IF EXISTS `tl3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tl3` AS SELECT
 1 AS `id`,
 1 AS `time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top3p`
--

DROP TABLE IF EXISTS `top3p`;
/*!50001 DROP VIEW IF EXISTS `top3p`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top3p` AS SELECT
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `mg`
--

/*!50001 DROP VIEW IF EXISTS `mg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mg` AS select `o`.`id` AS `id`,`o`.`time` AS `time` from ((`orderdetail` `od` join `product` `p`) join `order` `o`) where ((`od`.`productId` = `p`.`id`) and (`o`.`id` = `od`.`orderId`) and (`p`.`name` like 'Máy Giặt')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mg1`
--

/*!50001 DROP VIEW IF EXISTS `mg1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mg1` AS select `o`.`id` AS `id`,`o`.`time` AS `time` from ((`orderdetail` `od` join `product` `p`) join `order` `o`) where ((`od`.`productId` = `p`.`id`) and (`o`.`id` = `od`.`orderId`) and (`p`.`name` like 'Máy Giặt')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mg2`
--

/*!50001 DROP VIEW IF EXISTS `mg2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mg2` AS select `o`.`id` AS `id`,`o`.`time` AS `time` from ((`orderdetail` `od` join `product` `p`) join `order` `o`) where ((`od`.`productId` = `p`.`id`) and (`o`.`id` = `od`.`orderId`) and (`p`.`name` like 'Máy Giặt') and (`od`.`quantity` > 10) and (`od`.`quantity` < 20)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mg3`
--

/*!50001 DROP VIEW IF EXISTS `mg3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mg3` AS select `o`.`id` AS `id`,`o`.`time` AS `time` from ((`orderdetail` `od` join `product` `p`) join `order` `o`) where ((`od`.`productId` = `p`.`id`) and (`o`.`id` = `od`.`orderId`) and (`p`.`name` like 'Máy Giặt') and (`od`.`quantity` >= 10) and (`od`.`quantity` <= 20)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tl`
--

/*!50001 DROP VIEW IF EXISTS `tl`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tl` AS select `o`.`id` AS `id`,`o`.`time` AS `time` from ((`orderdetail` `od` join `product` `p`) join `order` `o`) where ((`od`.`productId` = `p`.`id`) and (`o`.`id` = `od`.`orderId`) and (`p`.`name` like 'Tủ Lạnh')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tl1`
--

/*!50001 DROP VIEW IF EXISTS `tl1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tl1` AS select `o`.`id` AS `id`,`o`.`time` AS `time` from ((`orderdetail` `od` join `product` `p`) join `order` `o`) where ((`od`.`productId` = `p`.`id`) and (`o`.`id` = `od`.`orderId`) and (`p`.`name` like 'Tủ Lạnh') and (`od`.`quantity` > 10) and (`od`.`quantity` < 20)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tl3`
--

/*!50001 DROP VIEW IF EXISTS `tl3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tl3` AS select `o`.`id` AS `id`,`o`.`time` AS `time` from ((`orderdetail` `od` join `product` `p`) join `order` `o`) where ((`od`.`productId` = `p`.`id`) and (`o`.`id` = `od`.`orderId`) and (`p`.`name` like 'Tủ Lạnh') and (`od`.`quantity` >= 10) and (`od`.`quantity` <= 20)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top3p`
--

/*!50001 DROP VIEW IF EXISTS `top3p`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top3p` AS select `product`.`price` AS `price` from `product` group by `product`.`price` order by `product`.`price` desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-22 16:36:01

select * from product;
select * from `order`;
select * from orderdetail;






select * from customer;
show tables;


-- Mức 1:
-- In ra các sản phẩm có số lượng từ 30 trở lên.
select * from product
where quantity >= 30;

-- In ra các sản phẩm có số lượng từ 30 trở lên và có giá trong khoảng 100 đến 300.
select * from product
where quantity >= 30 and price between 100 and 300 ;

-- In ra thông tin khách hàng tuổi lớn hơn 18
select *
from customer
where age > 18;

-- In ra thông tin khách hàng họ Nguyễn và lớn hơn 20 tuổi
select * from customer
where name like  'Nguyễn%' and age > 20;

-- In ra sản phẩm tên bắt đầu bằng chữ M
select * from product
where name like 'M%';

-- In ra sản phẩm kết thức bằng chữ E
select * from product
where name like '%e';

-- In ra danh sách sản phẩm số lượng tăng dần
select * from product
order by quantity desc;

-- In ra danh sách sản phẩm giá giảm dần
select * from product
order by price desc;

-- Mức 2:
-- In ra tổng số lượng sản phẩm giá nhỏ hơn 300
select id, sum(quantity) as TotalQuantity from product
where price < 300;

-- In tổng số sản phẩm theo từng giá
select *, sum(price*quantity) as ToTal from product
group by id,name,price,quantity;

-- In ra sản phẩm có giá cao nhất
select id,name, max(price) as MaxPrice
from product
group by id
having MaxPrice >=(select max(price) from product);

-- In ra giá trung bình của tất cả các sản phẩm
select avg(price) as AvgPriceProduct from product;

-- In ra tổng số tiền nếu bán hết tất cả sản phẩm.
select sum(price*quantity) as SumAllProduct from product;

-- Tính tổng số sản phẩm giá <300.
select sum(quantity) as TotalProductPriceSmallerThan300
from product
where price < 300;

-- Tìm giá bán cao nhất của các sản phẩm bắt đầu bằng chữ M.
select id,name, max(price) as MaxPrice from product
where name like 'M%'
group by id
having MaxPrice >=(select max(price) from product);

-- Thấp nhất của các sản phẩm bắt đầu bằng chữ M.
select id,name, min(price) as MinPrice from product
where name like 'M%'
group by id
having MinPrice <=(select min(price) from product);

-- Trung bình của các sản phẩm bắt đầu bằng chữ M.
select avg(price) as AVGPrice from product
where name like 'M%';

-- Mức 3:
-- In ra tên khách hàng và thời gian mua hàng.
select `order`.id, `order`.time, customer.name
from `order`
join customer on customer.id = `order`.customerId;

-- In ra tên khách hàng và tên sản phẩm đã mua
select  customer.name as NameGuest,product.name as ProductBuy, orderdetail.quantity, `order`.time as Day
from product
join orderDetail on product.id = orderDetail.productId
join `order` on orderdetail.orderId = `order`.id
join customer on `order`.customerId = customer.id;

-- In ra mã hoá đơn và giá trị hoá đơn
select orderdetail.orderId, orderdetail.productId,  customer.name as Name,orderdetail.quantity, product.name as NameProduct, product.price as Price,orderdetail.quantity as QuantityOrder, sum(product.price*orderDetail.quantity) as Total
from orderdetail
join product on orderdetail.productId = product.id
join `order` on orderdetail.orderId = `order`.id
join customer on `order`.customerId = customer.id
group by  orderdetail.orderId, orderdetail.productId,  customer.name,orderdetail.quantity, product.name, product.price,orderdetail.quantity
;

select orderdetail.orderId,customer.name as Name, sum(product.price*orderDetail.quantity) as Total
from orderdetail
join product on orderdetail.productId = product.id
join `order` on orderdetail.orderId = `order`.id
join customer on `order`.customerId = customer.id
group by customer.name
;

-- In ra mã hoá đơn và giá trị hoá đơn giảm dần
select orderdetail.orderId,customer.name as Name, sum(product.price*orderDetail.quantity) as Total
from orderdetail
join product on orderdetail.productId = product.id
join `order` on orderdetail.orderId = `order`.id
join customer on `order`.customerId = customer.id
group by customer.name
order by Total desc;

-- ------------------
    select * from `order`;
select * from orderdetail;
select * from customer;
select * from product;
-- Mức 4-10 :
-- In ra các mã hóa đơn, trị giá hóa đơn bán ra trong ngày 19/6/2006 và ngày 20/6/2006.
select orderdetail.orderId,customer.name as Name, `order`.time, sum(product.price*orderDetail.quantity) as Total
from orderdetail
join product on orderdetail.productId = product.id
join `order` on orderdetail.orderId = `order`.id
join customer on `order`.customerId = customer.id
where `order`.time between '2006-06-19 00:00:00' and  '2006-06-21 00:00:00'
group by customer.name;

-- In ra các mã hóa đơn, trị giá hóa đơn trong tháng 6/2006, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
select orderdetail.orderId,customer.name as Name, `order`.time, sum(product.price*orderDetail.quantity) as Total
from orderdetail
join product on orderdetail.productId = product.id
join `order` on orderdetail.orderId = `order`.id
join customer on `order`.customerId = customer.id
where `order`.time between '2006-10-01 00:00:00' and '2006-10-30 00:00:00'
group by customer.name, `order`.time
order by Total desc;

-- In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 20/06/2006
select orderdetail.orderId,customer.id, customer.name as Name,product.name, `order`.time
from orderdetail
join product on orderdetail.productId = product.id
join `order` on orderdetail.orderId = `order`.id
join customer on `order`.customerId = customer.id
where `order`.time = '2006-06-20 00:00:00';

-- In ra danh sách các sản phẩm (MASP, TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
select product.id,customer.name as Name,product.name, `order`.time
from orderdetail
join product on orderdetail.productId = product.id
join `order` on orderdetail.orderId = `order`.id
join customer on `order`.customerId = customer.id
where customer.name = 'Nguyen Van A' and `order`.time between '2006-10-01 00:00:00' and '2006-10-30 00:00:00'

-- Tìm các số hóa đơn đã mua sản phẩm “Máy giặt” hoặc “Tủ lạnh”.
select orderDetail.orderId, orderDetail.productId,customer.name ,product.name, orderDetail.quantity,product.price, sum(product.price*orderDetail.quantity) as TotalPrice
from orderdetail
join product on orderdetail.productId = product.id
join `order` on orderdetail.orderId = `order`.id
join customer on `order`.customerId = customer.id
where product.name = 'Máy giặt' or product.name = 'Tủ Lạnh'
group by orderDetail.orderId, orderDetail.productId,customer.name ,product.name, orderDetail.quantity;

-- In ra danh sách các sản phẩm (MASP, TENSP) không bán được.
select * from orderdetail
where not exists(select * from product where product.id = orderDetail.productId);

-- In ra danh sách các sản phẩm (MASP, TENSP) có giá > 300 sản xuất bán được trong năm 2006.
select product.id, product.name,product.price, `order`.time
from orderdetail
join product on orderdetail.productId = product.id
join `order` on orderdetail.orderId = `order`.id
join customer on `order`.customerId = customer.id
where price > 300 and `order`.time between '2006-01-01 00:00:00' and '2006-12-31 00:00:00'
group by product.name;

-- Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.

select `order`.id, customer.id, product.name
from orderdetail
join product on orderdetail.productId = product.id
join `order` on orderdetail.orderId = `order`.id
join customer on `order`.customerId = customer.id
where `order`.time between '2006-01-01 00:00:00' and '2006-12-31 00:00:00'
group by product.name;

-- Tìm các số hóa đơn đã mua sản phẩm “Máy giặt” hoặc “Tủ lạnh”, mỗi sản phẩm mua với số lượng từ 10 đến 20.

select `order`.id, customer.id, product.name, orderDetail.quantity
from orderdetail
join product on orderdetail.productId = product.id
join `order` on orderdetail.orderId = `order`.id
join customer on `order`.customerId = customer.id
where orderDetail.quantity >= 10 and orderDetail.quantity <= 20 and product.name = 'Máy giặt' or product.name ='Tủ Lạnh';






























