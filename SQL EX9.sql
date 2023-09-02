create database cranlogs;
use cranlogs;


create table r_package_data(
	id int not null primary key auto_increment,
    datevalue date ,
    timevalue time,
    size int,
    r_version varchar(50),
    rTables_arch varchar(100),
    r_os varchar(100),
    package varchar(100),
    versions varchar(50),
    country varchar(100),
    ip_id int);

select * from r_package_data;


-- 9.1 give the total number of recordings in this table
select count(*) from r_package_data;

-- 9.2 the number of packages listed in this table?
select count(distinct(package)) from r_package_data ;

-- 9.3 How many times the package "Rcpp" was downloaded?
select count(package) from r_package_data where package='Rcpp';

-- 9.4 How many recordings are from China ("CN")?
select count(package) from r_package_data where country='CN';


-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
select package,count(package) as count_package from r_package_data  group by package order by count_package desc;


-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
 select a.package, count(*) from 
         (select * from r_package_data where 
		substr(timevalue, 1, 5)<"11:00" 
        and 
        substr(timevalue, 1, 5)>"09:00")as a
             group by a.package 
            order by 2 desc;

-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
select count(package) from r_package_data where country in('CN','JP','SG');


-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")
select country,COUNT(PACKAGE)  from r_package_data  group by COUNTRY HAVING count(package) > (select count(package) from r_package_data where country='CN')  ;

-- 9.9 Print the average length of the package name of all the UNIQUE packages
select avg(length(r.pp)) 
from (select distinct(package) as pp  from   r_package_data)  r;

-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
select package,count(package) as count_package from r_package_data  group by package order by count_package desc limit 1,1;
 
-- 9.11 Print the name of the package whose download count is bigger than 1000.
select package,count(package)  from r_package_data  group by package having count(package) > 1000 ;

-- 9.12 The field "r_os" is the operating system of the users.
    -- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).
SELECT SUBSTR(r_os, 1, 5) AS OS, 
	COUNT(*) AS 'Download Count', 
	SUBSTR(COUNT(*)/((SELECT COUNT(*) FROM r_package_data)*1.0)*100, 1, 4) || "%" AS PROPORTION
FROM r_package_data
GROUP BY SUBSTR(r_os, 1, 5);





