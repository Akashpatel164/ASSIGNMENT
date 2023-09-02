
---- 1. Write a query to display employee numbers and employee name (first name, last name)  of all the sales employees who received an amount of 2000 in bonus;
 
 select firstname,lastname,phone,bonus from contact JOIN SALESperson on contact.contactID=SALESperson.salespersonID
    where bonus=2000;
    
--- 2. Fetch address details of employees belonging to the state CA. (If address is null, provide default value N/A );

select addressline1,ifnull(addressline2,'N/A') from address join employeeaddress on address.addressid=employeeaddress.addressid 
 where stateprovinceid in (select stateprovinceid from stateproviNce where countryregioncode='CA')  ;

select * from employeeaddress;

select * from employee;

select * from stateprovince;

-- 3. Write a query that displays all the products along with the Sales OrderID even if an order has never been placed for that product;

 select name,salesorderid from product LEFT join salesorderdetail on product.productid=salesorderdetail.productID
 HAVING  SALESORDERID  IN (select  SALESORDERID from salesorderdetail);
 
 select * from salesorderdetail;
 
--- 4. Find the subcategories that have at least two different prices less than $15;
		SELECT * from product;

select *  from productsubcategory;

select name from productsubcategory where productsubcategoryid in (select productsubcategoryid from product where standardcost<15);

--- 5. A. Write a query to display employees and their manager details. Fetch employee id, employee first name, and manager id, manager name;

select employeeid,firstname,managerid  from  employee join contact on employee.contactid=contact.contactid;

select *  from  employee;
select * from contact;

--- B. Display the employee id and employee name of employees who do not have manager.
select employeeid,firstname,managerid  from  employee left join contact on employee.employeeid=contact.contactid where managerid is null;


--- 6. A. Display the names of all products of a particular subcategory 15 and the names of their vendors;
select * from product;

 
select p.name,v.vendorid,vv.name  from product p  join productvendor v on p.productid=v.productid 
                                  join  vendor vv on v.vendorid=vv.vendorid
 where p.productsubcategoryid=15 ;

select * from productvendor;
select * from vendor;


-- B. Find the products that have more than one vendor;
select productid,count(vendorid) as c_vendor from productvendor group by productid having c_vendor>1;

select name,p.productid,count(vendorid) as c_vendor from productvendor p join product on p.productid=product.productID group by productid having c_vendor>1;


-- 7. Find all the customers who do not belong to any store; 
select * from customer where customerid not in (select customerid from store);


-- 8. Find sales prices of product 718 that are less than the list price recommended for that product;

select s.unitprice,s.productid,p.name from salesorderdetail s join product p on s.salesorderid=p.ProductID
 where p.productid=718 and  s.UnitPrice < p.ListPrice ;



-- 9. Display product number, description and sales of each product in the year 2001. 

select productID, description , linetotal, year(salesorderdetail.ModifiedDate) as 'year' from productdescription
join salesorderdetail
on productdescription.ProductDescriptionID=salesorderdetail.ProductID
where year(salesorderdetail.ModifiedDate) = 2001;



-- 10. Build the logic on the above question to extract sales for each category by year. Fetch Product Name, Sales_2001, Sales_2002, Sales_2003. 
--     Hint: For questions 9 & 10 (From Sales.SalesOrderHeader, sales. SalesOrderDetail, 
--     Production. Product. Use ShipDate of SalesOrderHeader to extract shipped year.
--     Calculate sales using QTY and unitprice from Sales OrderDetail.)
select product.productID, product.name ,  year(salesorderdetail.ModifiedDate) as year from product join salesorderdetail
    on product.ProductID=salesorderdetail.ProductID 
     where year(salesorderdetail.ModifiedDate) in (2001, 2002, 2003);

