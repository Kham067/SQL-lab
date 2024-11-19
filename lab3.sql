DROP DATABASE IF EXISTS `company`;
CREATE DATABASE `company`;
USE `company`;

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` BIGINT(15) NOT NULL,
  `employee_id` INT NOT NULL,
  `customer_id` INT,
  `payment_method` INT NOT NULL,
  `transaction_method` DATETIME NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`invoice_id`)
);

CREATE TABLE `employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(30) NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `position` VARCHAR(30) NOT NULL,
  `employment_date` DATE NOT NULL,
  `department_id` INT,
  `manager_id` INT,
  `rate` FLOAT NOT NULL,
  `bonus` FLOAT,
  PRIMARY KEY (`employee_id`)
);

CREATE TABLE `department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(30) NOT NULL,
  `city` VARCHAR(30) NOT NULL,
  `new_field` VARCHAR(40) NOT NULL,
  `building_no` INT NOT NULL,
  `street` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`department_id`)
);

CREATE TABLE `product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(40) NOT NULL,
  `product_description` VARCHAR(150) NOT NULL,
  `category` VARCHAR(15) NOT NULL,
  `manufacture` VARCHAR(30) NOT NULL,
  `product_type` VARCHAR(15) NOT NULL,
  `amount` INT NOT NULL,
  `price` FLOAT NOT NULL,
  PRIMARY KEY (`product_id`)
);

CREATE TABLE `customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `gender` VARCHAR(1) NOT NULL,
  `birth_date` DATE NOT NULL,
  `phone_number` VARCHAR(15) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `discount` INT NOT NULL,
  PRIMARY KEY (`customer_id`)
);

CREATE TABLE `Order` (
  `orders_id` INT NOT NULL AUTO_INCREMENT,
  `employee_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`orders_id`)
);

alter table
department
alter
city
set default
'lviv';

alter table
employee
add unique
(user_name);

-- Додавання стовпців
ALTER TABLE `Order`
ADD `invoice_id` BIGINT(15) NOT NULL;

ALTER TABLE `Order`
ADD `order_datetime` DATETIME NOT NULL;

ALTER TABLE `Order`
ADD `quantity` INT NOT NULL;

-- Додавання зовнішніх ключів
ALTER TABLE `Order`
ADD CONSTRAINT `Order_fk1` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);

ALTER TABLE `Order`
ADD CONSTRAINT `Order_fk2` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);

ALTER TABLE `Order`
ADD CONSTRAINT `Order_fk3` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);

ALTER TABLE `Order`
ADD CONSTRAINT `Order_fk4` FOREIGN KEY (`invoice_id`) REFERENCES `invoice`(`invoice_id`);

-- Зміна стовпців
ALTER TABLE `customer`
MODIFY `phone_number` VARCHAR(15) NOT NULL;

ALTER TABLE `employee`
MODIFY `position` VARCHAR(30) NOT NULL;

ALTER TABLE `department`
MODIFY `building_no` INT(4);

ALTER TABLE `employee`
ADD CONSTRAINT `employee_fk6` FOREIGN KEY (`department_id`) REFERENCES `department`(`department_id`);

ALTER TABLE `employee`
ADD CONSTRAINT `employee_fk7` FOREIGN KEY (`manager_id`) REFERENCES `employee`(`employee_id`);
