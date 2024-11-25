use company;

-- 1 --

 select 
    o.orders_id as 'Orders ID',
    p.product_name as 'Product name',
    p.category as 'Product category',
    i.invoice_id as 'Invoice ID',
    i.transaction_method as 'Transaction method',
    c.last_name as 'Customer last name',
    c.first_name as 'Customer first name'
from 
    orders as o
join 
    product as p on o.product_id = p.product_id
join 
    invoice as i on o.invoice_id = i.invoice_id
join 
    customer as c on i.customer_id = c.customer_id
order by
    o.orders_id;


-- 2 -- 


select
	o.orders_id "Orders ID",
    d.department_name "Department name",
    e.user_name "User name",
    p.product_name "Product name",
	p.category "Product category",
    i.invoice_id "Invoice ID",
    i.transaction_method "Transaction Method",
    c.last_name "Customer Last Name",
    c.first_name "Customer first name"
from 
	orders as o 
join 
	product as p on o.product_id = p.product_id
join 
	invoice as i on o.invoice_id = i.invoice_id
left join
	customer as c on i.customer_id = c.customer_id
join 
	employee as e on i.employee_id = e.employee_id
join 
	department as d on e.department_id = d.department_id
where
	department_name = "Mercury"
and
	transaction_method between "2023-07-01" and "2023-10-01"
order by
	orders_id;

-- 3 --


select 
    c.customer_id as 'Customer ID',
    c.last_name as 'Last Name',
    c.first_name as 'First Name',
    i.invoice_id as 'Invoice ID',
    i.transaction_method as 'Transaction Method'
from 
    customer as c
left join 
    invoice AS i ON c.customer_id = i.customer_id
union
select 
    c.customer_id as 'Customer ID',
    c.last_name as 'Last Name',
    c.first_name as 'First Name',
    i.invoice_id as 'Invoice ID',
    i.transaction_method as 'Transaction Method'
from 
    customer as c
right join 
    invoice as i on c.customer_id = i.customer_id
order by
    `Invoice ID`;
    