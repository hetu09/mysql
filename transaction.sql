-- bank db
create database `bank`;

-- transaction table

create table `transaction`(
    `transaction_id` INT NOT NULL AUTO_INCREMENT,
    `transaction_ac_no` INT NOT NULL,
    `transaction_ac_holder_name` VARCHAR(50) NOT NULL,
    `transaction_value` DOUBLE(10,2) NOT NULL DEFAULT '0.00',
    `transaction_type` SET('cr','dr') NOT NULL DEFAULT 'cr',
    `transaction_date` DATE NOT NULL,
    `gender` SET('female','male') NOT NULL DEFAULT 'female',
    `address` VARCHAR(50) NOT NULL,
    `city` VARCHAR(50) NOT NULL,
    `state` VARCHAR(50) NOT NULL,
    `phone_no` VARCHAR(50) NOT NULL,
    `email_id` VARCHAR(50) NOT NULL,
    `modified_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY  (transaction_id)
    );