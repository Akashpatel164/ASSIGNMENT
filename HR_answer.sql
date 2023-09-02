
--- 1. Display all information in the tables EMP and DEPT.
select * FROM employees,departments;

--- 2. Display only the hire date and employee name for each employee. 
select first_name,last_name,hire_date from employees; 


--- 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title ;
select concat(first_name,",",'  ',job_id)  as 'employee and title' from employees;

-- 4. Display the hire date, name and department number for all clerks. 
select first_name,hire_date,department_id from employees;

--- 5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT
select concat(employee_id,',',first_name,',',last_name,',',email,',',phone_number,',',hire_date,',',job_id,',',salary,',',
               commission_pct,',',manager_id,',',department_id) as 'THE OUTPUT' FROM employees;
 
 
--- 6. Display the names and salaries of all employees with a salary greater than 2000. 
select first_name,salary from employees where salary>2000; 

--- 7. Display the names and dates of employees with the column headers "Name" and "Start Date"
 select first_name as 'Name' ,hire_date as 'start date' from employees; 


--- 8. Display the names and hire dates of all employees in the order they were hired. 
select first_name,hire_date from employees order by hire_date;

--- 9. Display the names and salaries of all employees in reverse salary order. 
select first_name,salary from employees order by salary desc;

--- 10. Display "ename" and "deptno" who are all earned commission and display salary in reverse order
--- select first_name,department_id,commission_pct,salary  from employees where commission_pct is not null order by salary desc;


--- 11) Display the last name and job title of all employees who do not have a manager ;	
select last_name,job_id from employees where manager_id is null ;


--- 12. Display the last name, job, and salary for all employees whose job is sales representative 
      -- or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000;
 select last_name,job_id,salary from employees where job_id in('SA_REP','ST_CLERK') AND SALARY NOT IN(2500,3500,5000); 
 
 
 --- 1) Display the maximum, minimum and average salary and commission earned. 
 select max(salary),min(salary),avg(salary),sum(commission_pct) from employees;
 
--- 2) Display the department number, total salary payout and total commission payout for each department. 
select department_id,sum(salary),sum(commission_pct) from employees group by department_id;

--- 3) Display the department number and number of employees in each department. 
select department_id,count(employee_id) from employees group by department_id; 

--- 4) Display the department number and total salary of employees in each department. 
select department_id,sum(salary) from employees group by department_id;

--- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name 
select first_name as ' ' from employees where commission_pct is null; 

-- 6) Display the employees name, department id and commission. If an Employee doesn't earn the commission;
  ---   then display as 'No commission'. Name the columns appropriately;
  select * from employees;
 select first_name,department_id,commission_pct,
   case when commission_PCT is null then 'NO COMMISSION' 
     ELSE ' ' 
     end as 'APPROPRIATELY'
 from EMPLOYEES;
 
-- 7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns  appropriately;
 SELECT FIRST_NAME,salary,(commission_pct*2),
   case when commission_PCT is null then 'NO COMMISSION' 
     ELSE ' ' 
     end as 'APPROPRIATELY'
 from employees;
 
  
-- 8) Display the employee's name, department id who have the first name same as another employee in the same department.
select first_name,count(first_name) ,department_id from employees group by first_name  having count(first_name)>1   ;

-- 9) Display the sum of salaries of the employees working under each Manager. 
select sum(salary),manager_id from employees group by manager_id;


-- 10) Select the Managers name, the count of employees working under and the department ID of the manager. 
select manager_id ,count(first_name) from employees group by manager_id;


--  11) Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a! 
select last_name,department_id,salary from employees  where last_name like '%a';

-- 12) Display the average of sum of the salaries and group the result with the department id.  Order the result with the department id. 
select sum(salary),department_id from employees group by department_id;

-- 13) Select the maximum salary of each department along with the department id 
select max(salary),department_id from employees group by department_id;

-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1
select commission_pct,
     case when commission_pct is null then '1'
     else (SALARY + salary*0.1) end as 'COMMISSION';


-- 1. Write a query that displays the employee's last names only from 
-- the string's 2-5th position with  the first letter capitalized and all other letters lowercase, Give each column an appropriate label.
 select  substr(last_name,1,5) as 'AN APPROPRIATE'  from employees;
 
 
-- 2. Write a query that displays the employee's first name and last name along with a " in 
     --   between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined.
select concat(first_name,'-',last_name),monthname(hire_date)  as 'joing month'from employees;

-- 3. Write a query to display the employee's last name and if half of the salary is greater than 
--    ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label. 
select last_name,salary/2,
  case when (salary/2)>10000 then (salary+salary*0.1)
   else (salary+salary*0.115+1500) end as 'AN APPROPRIATE'
 from employees  ; 

-- 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end; 
--  department id, salary and the manager name all in Upper case, if the Manager name consists of 'z' replace it with '$! ;
select concat(manAger_id,'E'),DEpartment_id,salary from employees;

-- 5. Write a query that displays the employee's last names with the first letter capitalized and 
-- all other letters lowercase, and the length of the names, for all employees whose name ;
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names ;
select first_name,last_name  FROM EMPLOYEES where first_name like 'J%' OR FIRST_NAME LIKE 'A%' OR FIRST_NAME LIKE 'M%' order by LAST_NAME ;

-- 6. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY ;
select LAST_NAME,LPAD(SALARY,15,'$')  AS SALARY FROM EMPLOYEES;


-- 7. Display the employee's name if it is a palindrome ;
SELECT (FIRST_Name) from EmployeeS where 
          REVERSE (FIRST_Name)=(FIRST_Name);


-- 8. Display First names of all employees with initcaps. 
SELECT initcap(FIRST_NAME) FROM EMPLOYEES;

-- 9. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column. 
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(STREET_ADDRESS, ' ', 2), ' ', -1) AS extracted_word
FROM LOCATIONS;

-- 10. Extract first letter from First Name column and append it with the Last Name. Also add 
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should be in lower case. Display this along with their First Name. 
select lower(concat(substr(first_name,1,1),last_name,'@systechusa.com')) as 'e-mail' from employees;

-- 11. Display the names and job titles of all employees with the same job as Trenna. 
select first_name,job_TITLE,e.job_id from employees e JOIN JOBS ON e.job_id=JOBS.job_id where job_title='stock clerk';


-- 12. Display the names and department name of all employees working in the same city as Trenna. 
SELECT first_name,department_name FROM EMPLOYEES join departments on EMPLOYEES.department_id=departments.department_id  where location_id=1500;

-- 13. Display the name of the employee whose salary is the lowest.
select first_name,salary from employees order by salary  limit 1  ;

 
-- 14. Display the names of all employees except the lowest paid.
select first_name,salary from employees order by salary limit 1,107  ;

-- 1. Write a query to display the last name, department number, department name for all employees. 
select last_name,department_name from employees join departments on employees.department_id=departments.department_id;

-- 2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output. 
select first_name,job_id,location_id from employees join departments on employees.department_id=departments.department_id  
   where department_id in (select department_id from departments having department_id=40);

-- 3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission. 
select last_name,d.location_id,city from employees join departments d on employees.department_id=d.department_id 
  join locations on d.location_id=locations.location_id where commission_pct is not null ;

-- 4. Display the employee last name and department name of all employees who have an 'a' in their last name 
select last_name,department_name from employees join departments on employees.department_id=departments.department_id where last_name like '%a%';

-- 5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA. 
select last_name,job_id,e.department_id,department_name from employees e join departments on e.department_id=departments.department_id;

-- 6. Display the employee last name and employee number along with their manager's last name and manager number.
select last_name,employee_id,manager_id from employees where manager_id is not null ;
 
-- 7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager). 
select last_name,employee_id,manager_id from employees;
 
-- 8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee. 
select last_name,department_id from employees order by department_id;

-- 9. Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=5000=A, >=3000=B,<30000C) 
select first_name,job_id,department_name,salary,
  case when salary>=5000 then 'A'
		when SALARY >=3000 then 'B'
        ELSE 'C' END AS 'GRADE' FROM  EMPLOYEES join departments on EMPLOYEES.department_id=departments.department_id ;
      

-- 10. Display the names and hire date for all employees who were hired before their 
-- managers along withe their manager names and hire date. Label the columns as Employee 
-- name, emp_hire_date,manager name,man_hire_date
select first_name as 'name',hire_date as 'emp_hire_date',manager_id  from employees;

-- 1. Write a query to display the last name and hire date of any employee in the same department as SALES. 
select last_NAME,hire_date from  employees join departments on employees.department_id=departments.department_id where department_NAME='SALES';

-- 2. Create a query to display the employee numbers and last names of all employees who 
-- earn more than the average salary. Sort the results in ascending order of salary.
select employee_id,last_name,salary from employees having salary>(select avg(salary) from employees)  order by salary  ;
 
-- 3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u 
select employee_id,last_name from employees where last_name like '%u%';


-- 4. Display the last name, department number, and job ID of all employees whose  department location is ATLANTA. 
select last_name,department_id,job_id from employees;

-- 5. Display the last name and salary of every employee who reports to FILLMORE. 
select * from departments;
select last_name,salary from employees join departments on employees.department_id=departments.department_id 
  join locations on departments.location_id=locations.location_id where city='london' ;
select * from locations;


-- 6. Display the department number, last name, and job ID for every employee in the OPERATIONS department. 
select e.department_id,last_name,job_id from employees e join  departments d on e.department_id=d.department_id where department_name='Operations';

-- 7. Modify the above query to display the employee numbers, last names, and salaries of all 
-- employees who earn more than the average salary and who work in a department with any employee with a 'u'in their name.
select employee_id,last_name,salary from employees having salary>(select avg(salary) from employees) and last_name like '%u%'  ;
 
-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept. 
select first_name,job_id,department_name from employees join departments on employees.department_id=departments.department_id where department_name='sales' ;
-- 9. Write a compound query to produce a list of employees showing raise percentages, 
-- employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
-- given a 15% raise, and employees in department 6 are not given a raise. 

select department_id,salary,
     case when department_id in(10,30) then (salary + salary * 0.05) 
         when department_id=20 then (salary + salary * 0.1)
         when department_id in (40,50) then (salary+ salary *0.15)
     else ' ' end as 'raise_salary' from employees ;
select * from employees;

-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries. 
select last_name,salary from employees order by salary desc limit 3;
 

-- 11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column 
select first_name,salary, 
     case when commission_pct is null then 0
     else commission_pct end as 'commission_pct'from employees;

-- 12. Display the Managers (name) with top three salaries along with their salaries and department information.
select e.manager_id,max(salary),department_name from employees e join departments on e.department_id=departments.department_id 
 group by e.manager_id order by salary desc limit 3 ;
 
 

      