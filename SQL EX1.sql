create database computer_storedb;
use computer_storedb;
CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);
-- 1 Select the names of all the products in the store.
select name from Products;

-- 2 Select the names and the prices of all the products in the store.
select name,price from products;

-- 3 Select the name of the products with a price less than or equal to $200.
select name,price from products where price<=200;

-- 4 Select all the products with a price between $60 and $120.
select name,price from products where price between 60 and 120;

--  5. Select the name and price in cents (i.e., the price must be multiplied by 100).
select name,price * 100  as pricecent from products ;

-- 6 Compute the average price of all the products.
select avg(price) from products;

---   7. Compute the average price of all products with manufacturer code equal to 2.
select avg(price) from products where manufacturer=2;

--   8. Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*) FROM Products WHERE Price >= 180;

--  9. Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
select name,price from products where price>=180 order by price desc,name asc ;

-- 10 Select all the data from the products, including all the data for each product's manufacturer.
select * from products join Manufacturers on products.Manufacturer=Manufacturers.Code;

-- 11 Select the product name, price, and manufacturer name of all the products.
select pr.name,pr.price,ma.name from Products Pr  join Manufacturers Ma on Pr.Manufacturer=Ma.Code;

-- 12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
select avg(pr.price),ma.code from Products Pr  join Manufacturers Ma on Pr.Manufacturer=Ma.Code group by ma.code;

SELECT AVG(Price), Manufacturer
    FROM Products
GROUP BY Manufacturer;

-- 13 Select the average price of each manufacturer's products, showing the manufacturer's name.
select avg(pr.price),ma.name from Products Pr  join Manufacturers Ma on Pr.Manufacturer=Ma.Code group by ma.name;

-- 14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
select avg(price),ma.name  from Products pr join manufacturers ma on Pr.Manufacturer=Ma.Code  group by manufacturer having avg(price)>=150 ;

-- 15 Select the name and price of the cheapest product.
select  name,price  from products order by price  limit 1; 

-- 16 Select the name of each manufacturer along with the name and price of its most expensive product.
select ma.name,pr.name,max(pr.price) from Products Pr  join Manufacturers Ma on Pr.Manufacturer=Ma.Code  group by ma.name;

 
select ma.name,pr.name,pr.price from Products Pr right join Manufacturers Ma on Pr.Manufacturer=Ma.Code  group by ma.name order by pr.price desc ;

-- 17 Add a new product: Loudspeakers, $70, manufacturer 2.
insert into Products(code,NAME,price,Manufacturer)
values(11,'Loudspeakers',70,2);

-- 18 Update the name of product 8 to "Laser Printer".
update products set name='laser printer' where code=8;

-- 19 Apply a 10% discount to all products.
select name,(price - 0.10 * price) as price_10 from products; 

-- 20 Apply a 10% discount to all products with a price larger than or equal to $120.
select name,price,(price - 0.1*price)
        from products where price>=120 ;



