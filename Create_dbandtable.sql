CREATE DATABASE upi_payment_db;

USE upi_payment_db;

-- Create a single table 
CREATE TABLE historical_payment_records (
    `transaction id` VARCHAR(50) NOT NULL PRIMARY KEY,
    `timestamp` DATETIME NOT NULL,
    `transaction type` VARCHAR(50),
    `merchant_category` VARCHAR(100),
    `amount (INR)` DECIMAL(10,2) NOT NULL,
    `transaction_status` VARCHAR(50) NOT NULL,
    `sender_age_group` VARCHAR(20),
    `receiver_age_group` VARCHAR(20),
    `sender_state` VARCHAR(100),
    `sender_bank` VARCHAR(100) NOT NULL,
    `receiver_bank` VARCHAR(100),
    `device_type` VARCHAR(50),
    `network_type` VARCHAR(50),
    `fraud_flag` INT NOT NULL DEFAULT 0,
    `hour_of_day` INT,
    `day_of_week` VARCHAR(20),
    `is_weekend` INT
);


SHOW TABLES;

SELECT * from historical_payment_records;
