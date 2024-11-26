
use company;
-- 1 --
SELECT 
*
FROM 
customer
ORDER BY
last_name ASC;

-- 2 --

SELECT DISTINCT manufacture
FROM product
ORDER BY manufacture ASC;

-- 3 --

SELECT product_name, manufacture, category, product_type, price 
FROM product
WHERE manufacture = 'DELL'
ORDER BY product_name ASC;

-- 4 --

SELECT first_name, last_name, gender, birth_date, phone_number
FROM customer
WHERE gender = 'F' 
AND birth_date BETWEEN '1990-01-01' AND '2000-12-31'
ORDER BY last_name ASC;

-- 5 --

SELECT product_name , manufacture, category, product_description, price
FROM product
WHERE category = 'NOTEBOOK'
AND product_description LIKE '%512GB%';

-- 6 --

SELECT product_id, product_name , manufacture, category, product_description, price
FROM product
WHERE category in ('NOTEBOOK','Desktops')
AND 
 (product_description LIKE '%512GB%' 
OR 
product_description LIKE '%1TB%')
ORDER BY  product_name;

-- 7 --
 
 SELECT *
FROM
	invoice
WHERE 
	customer_id IS NULL;














-- Крок 1: Видалити зовнішній ключ
ALTER TABLE orders DROP FOREIGN KEY Order_fk1;

-- Крок 2: Видалити стовпець
ALTER TABLE orders DROP COLUMN employee_id;

-- Крок 3: Перевірити структуру таблиці
DESCRIBE orders;


use company;

-- Крок 1: Видалити зовнішній ключ
ALTER TABLE orders DROP FOREIGN KEY Order_fk3;

-- Крок 2: Видалити стовпець
ALTER TABLE orders DROP COLUMN customer_id;

-- Крок 3: Перевірити структуру таблиці
DESCRIBE orders;

SELECT * FROM invoice WHERE invoice_id = '20220902081028';

