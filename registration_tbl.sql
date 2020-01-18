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

-- drop field
ALTER TABLE `stud_reg_tbl` DROP `stud_surname`