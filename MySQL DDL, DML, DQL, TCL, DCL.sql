-- 1
CREATE DATABASE COMPANY;
USE COMPANY;
-- 2
CREATE TABLE DEPARTMENT ( dept_id int primary key, dept_name varchar(50) unique not null, location varchar(50)); 
select * from department

-- 3
create table employees (emp_id int auto_increment primary key,
name varchar(50) not null,
email varchar(50) unique, 
salary decimal(10,2) check (salary >0),
city varchar(50) default 'chennai' ,
dept_id int ,
hire_date date,
 foreign key (dept_id) references department (dept_id));
 -- 4 
 alter table employees add phone varchar(12);
 
 -- 5 
 alter table employees drop column phone;
 
 -- 6 
 -- 7 cannot insert bocs it is "UNQUE"
 -- 8 -500 Cannot insert- bocos it is "less than 0"
 -- 9  null value cannot insert 
 -- 10 
 
 insert into DEPARTMENT ( dept_id, dept_name, location) values 
 (1, 'IT', 'chennai'),
 (2, 'HR', 'bangalore'),
 (3, 'Sales', 'mumbai');
 
 -- 11
 insert into employees (emp_id, name, email, salary, city, dept_id, hire_date) values
 (1, 'Arun ', 'arun@co.com', 55000 , 'chennai',1,'2022-03-15 '),
 (2,'Divya ', 'divya@co.com ', 48000 , 'Madurai ', 2,'2021-07-01 '),
 (3, 'Karthik ', 'karthik@co.com ', 62000 , 'Chennai ', 1 , '2020-01-10 '),
 (4, 'Meena' ,  'meena@co.com ', 40000 , 'Coimbatore ', 3 , '2023-05-20 ' ),
 (5, 'Ravi ', 'ravi@co.com ' , 52000 , 'Chennai ', 3, '2022-11-05 ');
 select * from employees
 
 -- 12
  insert into employees (name, email, salary, dept_id, hire_date) values 
  ('sana', 'sana@co.com', 45000,  2,'2024-02-01')
 
 select * from employees
 
 -- 13 
 update employees set salary= salary *1.10 
 where dept_id =1 ; 
 
 -- 14
 delete from employees where emp_id=6;
 
-- 15
select * from employees
-- 16
select name, salary from employees where salary >50000;

-- 17
select * from employees where city='chennai' order by salary desc; 
-- 18
select dept_id, count(*) as total_emp from employees 
group by dept_id;

-- 19 
select avg(salary), max(salary) from employees

-- 20 
select name, dept_name from employees e 
join department d on d.dept_id = e.dept_id; 

-- 21
select name from employees
where name like'm%';

-- 22
start transaction ;
update employees set salary= salary + 5000
where emp_id =1;
savepoint s1;
delete from employees where emp_id = 5 ; 
rollback to s1;
commit;
-- 23
-- 1. yes & 2. yes

-- 24  
set autocommit = 0;

-- 25
-- No, truncate is permenent 

-- 26
Create  user 'hr_user'@'localhost' identified by 'AJITHKUMAR@15'

-- 27
GRANT SELECT, UPDATE ON EMPLOYEES TO 'hr_user'@'localhost';

-- 28
show grants for 'hr_user'@'localhost';
-- 29
revoke update on employees from 'hr_user'@'localhost';
-- 30
drop user 'hr_user'@'localhost';
