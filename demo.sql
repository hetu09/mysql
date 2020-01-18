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


-------
--AGGREGATE :
-- int,float,double...
-- max
-- min
-- avg
-- sum

--- col where clause not use
-- count

---
-- having
-- group by
----

SELECT count(*) as 'total_emp' FROM `employee` WHERE emp_name = 'sumit'


SELECT emp_name,count(*) as 'total_emp' 
FROM `employee`
GROUP BY emp_name
having  total_emp >= 1;


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
ORDER BY emp_address asc