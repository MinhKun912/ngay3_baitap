CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;
CREATE TABLE customer
(
    cID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cname VARCHAR(60) NOT NULL,
    cAge  tinyint NOT NULL
);
CREATE TABLE `order`
(
    oId   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cID int,
    foreign key (cID) references customer(cID) ,
  oDate datetime ,
  oTotalPrice int 
);
CREATE TABLE product
(
    pId   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pName VARCHAR(30) NOT NULL,
    pPrice  INT
);

CREATE TABLE orderDetail
(
oId INT,
foreign key(oId)references `order`(oId),
pID int,
foreign key(pId) references product(pId),
orderQuantity INT
);

insert into customer (cname,cage) values
 ('Minh Quan',10),
 ('Ngoc Oanh',20),
 ('Hong Ha',20);


INSERT INTO `order` (cId, oDate)
VALUES 
(1, '2006-3-21'),
(2, '2006-3-23'),
(1, '2006-3-16');

INSERT INTO product
VALUES (1, 'May Giat', 3),
       (2, 'Tu lanh', 5),
       (3, 'Dieu hoa', 5),
       (4, 'QUAT', 1);

INSERT INTO orderDetail 
VALUES (1, 1, 3),
       (1, 3, 7),
       (2, 1, 1),
       (1, 3, 7),
       (2, 3, 3),
       (3, 1, 8);
       
SELECT o.oId ,o.oDate,o.ototalPrice FROM `order` o;


SELECT  c.cname,p.pName from( (customer c 
JOIN `order` on c.cID=`order`.cId) 
JOIN orderdetail on `order`.oId=orderdetail.oId)
JOIN product p on p.pId=orderdetail.pId; 

SELECT * from customer WHERE cid not in (SELECT distinct  `order`.cid from `order`);


SELECT od.oid,o.odate,  SUM(orderQuantity*pPrice) AS'Tong' from orderDetail od JOIN `order` o  on od.oid=o.oid
join product on product.pid=od.pid  group by o.oid
;

