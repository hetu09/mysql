-- create database

CREATE DATABASE database_name;

CREATE DATABASE student_registration_form;

-- for create table you need[tbl_name,field_name,defination_of_field]

CREATE TABLE table_name(Column_name Column_type);

CREATE TABLE `stud_reg_tbl`(
    `stud_id` INT NOT NULL AUTO_INCREMENT,
    `stud_fname` VARCHAR(50) NOT NULL,
    `stud_lname` VARCHAR(50) NOT NULL,
    `stud_address` VARCHAR(255) NOT NULL,
    `gender` SET('female','male') NOT NULL DEFAULT 'female',
    `city` SET('surat','mumbai','baroda','bardoli','ahmedabad') NOT NULL DEFAULT 'surat ',
    `distric` SET('gujrat','maharashtra','goa','andhra pradesh','assam') NOT NULL DEFAULT 'gujrat',
    `state` SET('gujrat','maharashtra','goa','andhra pradesh','assam') NOT NULL DEFAULT 'gujrat',
    `pincode` INT(6) not NULL,
    `course` SET('bca','mca','bsc.it','msc.it') NOT NULL DEFAULT 'bca',
    `stud_email` VARCHAR(50) NOT NULL,
    `stud_dob` DATE not NULL,
    `mobile_no` INT NOT NULL,
    `reg_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,    
    PRIMARY KEY(stud_id) 
);

-- insert
-- 1.default 
-- 2.custome
-- 3.multi insert

-- 1.default insert syntax:..

insert into stud_reg_tbl values(NULL,'ahana','ambani','bombay','female','mumbai','maharashtra','maharashtra',385001,'bca','ahana@gmail.com','2019-03-02','9856456345',CURRENT_TIMESTAMP);

-- 2.multi insert[deault/custome]

insert into stud_reg_tbl values
(NULL,'ruhi','raghvani','surat','female','surat','gujrat','gujrat',567009,'bsc.it','ruhi@gmail.com','2018-09-03','98567345555',CURRENT_TIMESTAMP),
(NULL,'rishi','raghvani','surat','male','surat','gujrat','gujrat',567009,'msc.it','rishi@gmail.com','2019-09-03','8567345367',CURRENT_TIMESTAMP),
(NULL,'rohit','raghvani','surat','male','surat','gujrat','gujrat',567009,'bsc.it','rohit@gmail.com','2018-09-03','1234563456',CURRENT_TIMESTAMP),
(NULL,'khushboo','chavda','ahmedabad','female','ahmedabad','gujrat','gujrat',567009,'msc.it','khushboo@gmail.com','2018-09-03','98556565656',CURRENT_TIMESTAMP),
(NULL,'akshay','chavda','ahmedabad','male','ahmedabad','gujrat','gujrat',567009,'bsc.it','akki@gmail.com','2018-01-04','8746456354',CURRENT_TIMESTAMP),
(NULL,'kinjal','gohil','ahmedabad','female','ahmedabad','gujrat','gujrat',567009,'msc.it','kinnu@gmail.com','2009-09-09','5673456735',CURRENT_TIMESTAMP),
(NULL,'tanu','gohil','ahmedabad','female','ahmedabad','gujrat','gujrat',567009,'bsc.it','tanvi@gmail.com','2020-01-12','98888885647',CURRENT_TIMESTAMP),
(NULL,'tinu','gohil','ahmedabad','male','ahmedabad','gujrat','gujrat',567009,'msc.it','tinu@gmail.com','2005-09-21','5645365476',CURRENT_TIMESTAMP),
(NULL,'rahul','gohil','ahmedabad','male','ahmedabad','gujrat','gujrat',567009,'bsc.it','rahul@gmail.com','2018-09-03','8756745637',CURRENT_TIMESTAMP),
(NULL,'hemal','gohil','ahmedabad','male','ahmedabad','gujrat','gujrat',567009,'bsc.it','hrmal@gmail.com','2018-09-03','9846735647',CURRENT_TIMESTAMP),
(NULL,'mitesh','gohil','mumbai','male','mumbai','maharashtra','maharashtra',567001,'mca','mit@gmail.com','2005-11-16','9846578367',CURRENT_TIMESTAMP),
(NULL,'nandini','gohil','mumbai','female','mumbai','maharashtra','maharashtra',567001,'mca','nandu@gmail.com','2012-12-12','98568845647',CURRENT_TIMESTAMP),
(NULL,'pritam','dhakan','mumbai','male','mumbai','maharashtra','maharashtra',567001,'mca','prit@gmail.com','2018-05-05','98567399647',CURRENT_TIMESTAMP),
(NULL,'arjun','allu','bardoli','male','bardoli','gujrat','gujrat',567009,'bsc.it','arjun@gmail.com','2001-03-03','98567345337',CURRENT_TIMESTAMP),
(NULL,'dipika','padukon','mumbai','female','mumbai','maharashtra','maharashtra',567001,'bca','dipika@gmail.com','2019-09-06','98447345647',CURRENT_TIMESTAMP),
(NULL,'rani','mukharji','mumbai','female','mumbai','maharashtra','maharashtra',567001,'bca','rani@gmail.com','2019-09-09','98567555647',CURRENT_TIMESTAMP),
(NULL,'amitabh','bachchan','mumbai','male','mumbai','maharashtra','maharashtra',567001,'mca','amitabh@gmail.com','2018-01-01','96667345647',CURRENT_TIMESTAMP),
(NULL,'abhishek','bachchan','mumbai','male','mumbai','maharashtra','maharashtra',567001,'bsc.it','abhi@gmail.com','2018-02-02','98567345647',CURRENT_TIMESTAMP),
(NULL,'jaya','bachchan','mumbai','female','mumbai','maharashtra','maharashtra',567001,'msc.it','jaya@gmail.com','2018-02-02','88567345647',CURRENT_TIMESTAMP);

-- 3.custome insert

insert into stud_reg_tbl(stud_fname,stud_lname,stud_address,pincode,stud_email,stud_dob,mobile_no)
values('niku','patel','sarol',394006,'nik24@gmail.com','1998-01-24','8967564785');

-- select all

select * from stud_reg_tbl;

-- select custom

select stud_fname,stud_email,gender from stud_reg_tbl;

-- 
-- drop field
ALTER TABLE `stud_reg_tbl` DROP `stud_surname`
