/*
SQL - structured query language

query => statement based task

MySQL -> SQL engine

phpMyAdmin -> php app ->webui
*/


/*
    Primary Key -> INDEX UNIQUE and NOT NULL [AUTO_INCREMENT] [single]
    NOT NULL 
    UNIQUE -> Index

    DEFAULT -> ON NULL ->specific value
*/
CREATE TABLE `employemgnt`.`employee` ( 
    `emp_id` INT(10) NOT NULL , 
    `emp_name` VARCHAR(50) NOT NULL ,
    `emp_address` TEXT NOT NULL , 
    `emp_email` VARCHAR(50) NOT NULL , 
    `emp_phone` VARCHAR(20) NOT NULL , 
    `emp_gender` SET('male','female') NOT NULL DEFAULT 'female' , 
    `emp_status` BOOLEAN NOT NULL DEFAULT TRUE ,
    `emp_salary` DOUBLE(10,2) NOT NULL DEFAULT '0.00' , 
    `emp_dob` DATE NOT NULL , 
    `modified_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
     );


/**
    Query with rules

*/
CREATE TABLE `employemgnt`.`employee` ( 
    `emp_id` INT(10) NOT NULL AUTO_INCREMENT, 
    `emp_name` VARCHAR(50) NOT NULL ,
    `emp_address` TEXT NOT NULL , 
    `emp_email` VARCHAR(50) NOT NULL , 
    `emp_phone` VARCHAR(20) NOT NULL , 
    `emp_gender` SET('male','female') NOT NULL DEFAULT 'female' , 
    `emp_status` BOOLEAN NOT NULL DEFAULT TRUE ,
    `emp_salary` DOUBLE(10,2) NOT NULL DEFAULT '0.00' , 
    `emp_dob` DATE NOT NULL , 
    `modified_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY(`emp_id`),
     UNIQUE KEY(`emp_email`),
     UNIQUE KEY(`emp_phone`)
     );


-- Default order insert 
INSERT INTO employee 
VALUES (NULL,'sumit',12,1200.05,'surat','1998-02-22','male',1,CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- custom order insert 
INSERT INTO employee(name,salary,age,address,dob)
VALUES ('neha',1025.55,25,'surat','1885-02-03');

-- multiple insert (defualt/custom)
INSERT INTO employee(name,salary,age,address,dob)
VALUES 
('smita',10565.55,29,'surat','1896-02-03'),
('nehali',1025.55,78,'surat','1878-02-03'),
('nehal',1027.55,10,'surat','1865-02-03'),
('sneha',1027.55,96,'surat','1889-02-03'),
('hemal',1029.55,100,'surat','2017-09-03'),
('neha2',1029.55,256,'surat','2000-02-03'),
('neha3',1025.55,36,'surat','1885-02-03');




-- select all
SELECT * FROM `employee`;

--select custom
SELECT emp_name, emp_address, emp_email FROM `employee`
-- 
SELECT emp_name, emp_email, emp_address
FROM `employee`


-- as keyword alias -> secodary naming
SELECT emp_name, emp_email, emp_address
FROM `employee`
-- table
SELECT e.emp_name, e.emp_email, e.emp_address
FROM `employee` as e

-- table aliasing
SELECT e.emp_name, e.emp_email, e.emp_address
FROM `employee` as e

-- coloum aliasing
SELECT e.emp_name as 'Employee Name', e.emp_email as 'Employee Email', e.emp_address as 'Employee Address'
FROM `employee` as e

-- distinct
-- unique set of data in perticular col.
SELECT DISTINCT(emp_address) FROM `employee`;

-- sql filter
-- Conditional statement
-- > < >= <= != = [<> => !=] 
-- AND OR NOT 
-- WHERE
SELECT * 
FROM `employee`
WHERE emp_name = 'sumit' ;


SELECT * 
FROM `employee`
WHERE emp_salary > 10000;
----
SELECT * 
FROM `employee`
WHERE emp_salary > 10000 and emp_status = 1 and emp_gender = 'male';


SELECT * 
FROM `employee`
WHERE emp_salary > 10000 or emp_status = 0 or emp_gender = 'female';


SELECT * 
FROM `employee`
WHERE (emp_salary > 10000 and emp_status = 1) or emp_gender = 'female';

SELECT * 
FROM `employee`
WHERE (emp_salary > 10000 and emp_status = 1) and NOT (emp_gender = 'female');

SELECT * 
FROM `employee`
WHERE (emp_salary > 10000 and emp_status = 1) and emp_gender <> 'female';


SELECT * 
FROM `employee` 
WHERE emp_dob < CURRENT_DATE()


SELECT * 
FROM `employee`
WHERE emp_dob < '2020-01-16';


SELECT * 
FROM `employee`
WHERE emp_dob <= '2020-01-16' and emp_dob >= '2020-01-01';


SELECT * 
FROM `employee`
ORDER BY emp_name asc;

SELECT * 
FROM `employee`
ORDER BY emp_name;

SELECT * 
FROM `employee`
ORDER BY emp_name DESC;

SELECT * 
FROM `employee`
ORDER BY emp_name DESC,emp_gender asc;
-------
--AGGREGATE :
-- int,float,double...
-- max
-- min
-- avg
-- sum

--- col
-- count

---
-- having
-- group by
----

SELECT count(*) as 'total_emp' 
FROM `employee` 
WHERE emp_name = 'sumit'


SELECT emp_name,count(*) as 'total_emp' 
FROM `employee`
GROUP BY emp_name
having  total_emp >= 1;


SELECT emp_address,count(*) as 'total_emp' 
FROM `employee`
GROUP BY emp_address
having  total_emp >= 2;


SELECT emp_name,count(*) as 'total_emp' 
FROM `employee`
WHERE emp_name = 'sumit'
GROUP BY emp_name
HAVING total_emp >= 1
ORDER BY total_emp asc;


SELECT emp_address,count(*) as 'total_emp' 
FROM `employee`
WHERE emp_gender = 'female'
GROUP BY emp_address
HAVING total_emp >= 1
ORDER BY emp_address asc;


SELECT emp_address,count(*) as 'total_emp' 
FROM `employee`
WHERE emp_gender = 'female'
GROUP BY emp_address
HAVING total_emp >= 1
ORDER BY total_emp desc,emp_address asc;


SELECT max(emp_salary) as 'max_sal' 
FROM `employee`;


SELECT min(emp_salary) as 'min_sal' 
FROM `employee`;


SELECT avg(emp_salary) as 'avg_sal' 
FROM `employee`;



SELECT emp_address , avg(emp_salary) as 'AVG_SAL'
FROM employee
GROUP BY emp_address
HAVING avg_sal > 5000;


SELECT emp_address , avg(emp_salary) as 'AVG_SAL'
FROM employee
WHERE emp_gender = 'female'
GROUP BY emp_address
HAVING avg_sal > 5000
ORDER by emp_address;

SELECT emp_name , max(emp_salary) as 'MAX_SAL'
FROM employee
WHERE emp_gender = 'female'
GROUP BY emp_salary,emp_name
ORDER by emp_name;


SELECT emp_address,sum(emp_salary) as 'total_salary' 
FROM `employee`
WHERE emp_gender = 'female'
GROUP BY emp_address
ORDER BY emp_address asc



------- sql filters ---------

SELECT * FROM `employee` WHERE emp_id IN (1,6,7);


SELECT * 
FROM `employee`
WHERE emp_salary BETWEEN 1000 AND 5000;


SELECT * 
FROM `employee`
WHERE emp_name IS NULL;


SELECT * 
FROM `employee`
WHERE emp_name IS NOT NULL;

-- start from s
-- pattern
SELECT * 
FROM employee
WHERE emp_name LIKE 's%';


-- end from a
SELECT * 
FROM employee
WHERE emp_name LIKE '%a';


SELECT * 
FROM employee
WHERE emp_name LIKE 'z_r_';

SELECT * 
FROM employee
WHERE emp_name LIKE 's_m%';


SELECT * 
FROM employee
WHERE emp_name LIKE '%s%';


/*
Regular Expression
regex
pattern matching
wildcard -> []
0-9 -> range
a-z -> 
A-Z

{1} -> length
{1,} -> 1 min and more length
*/

SELECT * FROM `contact_detail` WHERE contact rlike '[+91]-[6-9]{1}[0-9]{2}-[0-9]{3}-[0-9]{4}'
SELECT * FROM `contact_detail` WHERE contact rlike '[+1]-[1-5]{1}[0-9]{2}-[0-9]{3}-[0-9]{4}'
SELECT * FROM `contact_detail` WHERE email RLIKE '[a-zA-Z]{1,}[@][a-zA-Z]{1,6}[.][a-zA-Z]{2,3}'

-- join

-- inner join[Returns records that have matching values in both tables]

SELECT e.id as 'ID', e.name as 'Employee', dpt.name as 'Department',des.name as 'Designaton'
FROM tbl_employee as e
INNER JOIN tbl_desg as des ON des.id = e.desg_id
INNER JOIN tbl_dept as dpt ON dpt.id = e.dept_id



SELECT e.id as 'ID', e.name as 'Employee', dpt.name as 'Department',des.name as 'Designaton'
FROM tbl_employee as e
LEFT JOIN tbl_desg as des ON des.id = e.desg_id
LEFT JOIN tbl_dept as dpt ON dpt.id = e.dept_id


SELECT e.id as 'ID', e.name as 'Employee', des.name as 'Designaton'
FROM tbl_employee as e
RIGHT JOIN tbl_desg as des ON des.id = e.desg_id


SELECT e.id as 'ID', e.name as 'Employee', dpt.name as 'Department'
FROM tbl_employee as e
RIGHT JOIN tbl_dept as dpt ON dpt.id = e.dept_id


SELECT IFNULL(e.id,'-') as 'ID', IFNULL(e.name,'-') as 'Employee', dpt.name as 'Department'
FROM tbl_employee as e
RIGHT JOIN tbl_dept as dpt ON dpt.id = e.dept_id


SELECT id, name, salary , IF(tbl_employee.status = 'active','WORKING','LEFT' ) as 'Status' FROM `tbl_employee` 



SELECT id,name,salary,
  CASE
    WHEN tbl_employee.status = 'active' THEN "ACTIVE NOW"
    WHEN tbl_employee.status = 'disabled' THEN "LEFT COMPANY"
    ELSE "NO CURRENT STATUS"
  END as 'Status'
 FROM tbl_employee