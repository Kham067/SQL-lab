use company;
-- 1 --
select 
     employee_id "Manager_id",
     last_name "Manager_last_name",
	 first_name "Manager_first_name",
	 position 'Manager_titel',
     employment_date as 'Manager Hire Date'
 From
     employee as Managers
where
     position in ('CEO', 'Manager');
     
     --  2 --
select
      e.employee_id 'Employee ID',
      e.last_name 'Empolyee Last Name',
      e.first_name 'Employee First Name',
      e.position 'Employee Title',
      e.employment_date as 'Employee Hire Date',
      e.manager_id 'Employee Manager ID',
	  m.employee_id 'Manager ID',
      m.last_name 'Manager Last Name',
      m.first_name 'Manager First Name',
      m.position 'Manager Title',
      m.employment_date as 'Manager Hire Date'
From
     employee as e,
     employee as m
where 
     e.manager_id = m.employee_id;
	
-- 3 --- 

select
	  e.employee_id 'Employee ID',
      e.last_name 'Empolyee Last Name',
      e.first_name 'Employee First Name',
      e.position 'Employee Title',
      e.department_id 'Employee Department ID',
      d.department_id 'Department ID',
      d.department_name 'Department name'
from 
    employee as e,
    department as d
where
     e.department_id = d.department_id;
     
-- 4 --

select
	  e.employee_id 'Employee ID',
      e.last_name 'Empolyee Last Name',
      e.first_name 'Employee First Name',
      e.position 'Employee Title',
      i.employee_id 'Invoce Employee ID',
      i.invoice_id 'Invoce',
      i.transaction_method 'Transactoin moment'
from
    employee as e
join 
    invoice as i
on 
    e.employee_id = i.employee_id
order by 
        i.transaction_methodt;
        
-- 5 --

select
	  e.employee_id 'Employee ID',
      e.last_name 'Empolyee Last Name',
      e.first_name 'Employee First Name',
      e.position 'Employee Title',
      i.employee_id 'Invoce Employee ID',
      i.invoice_id 'Invoce',
      i. transaction_method 'Transactoin moment'
from
     employee as e 
natural join 
	  invoice as i
order by 
	    i. transaction_method;
        
-- 6 -- 

select 
	  e.employee_id 'Employee ID',
      e.last_name 'Empolyee Last Name',
      e.first_name 'Employee First Name',
      e.position 'Employee Title',
      i.employee_id 'Invoce Employee ID',
      i.invoice_id 'Invoce',
      i. transaction_method 'Transactoin moment',
      c.customer_id 'Customer ID',
      c.last_name 'Customer Last Name',
      c.first_name 'Customer First Name'
from
    employee as e
natural join 
	invoice as i 
join 
    customer as c
using (customer_id)
order by e.employee_id, i.invoice_id;

-- 7 --

use compay;

select
      e.employee_id 'Employee ID',
      e.last_name 'Empolyee Last Name',
      e.first_name 'Employee First Name',
      e.position 'Employee Title',
      i.employee_id 'Invoce Employee ID',
      i.invoice_id 'Invoce',
      i. transaction_method 'Transactoin moment',
      c.customer_id 'Customer ID',
      c.last_name 'Customer Last Name',
      c.first_name 'Customer First Name'
from
    employee as e 
natural join 
     invoice as i
left join 
	customer as c 
using (customer_id)
where customer_id is null
order by
     i.transaction_method;
     
-- 8 --

select
	  e.employee_id 'Employee ID',
      e.last_name 'Empolyee Last Name',
      e.first_name 'Employee First Name',
      e.position 'Employee Title',
      e.manager_id 'Employee Manager ID',
      e.department_id 'Employee department id',
      m.employee_id 'Manager ID',
      m.firsrt_name 'manager firsrt name',
      m.last_name 'Manager last name',
      m.position 'Manager position',
      m.department_id 'Manager department ID',
      d.department_id 'Department ID',
      d.department_name 'Department Name',
      d.city 'Department City'
from
      department as d
right join
      employee as e
on 
      e.departmet_id = d.department_id
left join
    employee as m
on e.manager_id = m.employee_id;

-- 9 --

select
	employee_id,
    first_name,
    last_name,
    position,
    'Consulting' as Responsibility
from 
	employee
where
	position like '%Consultant%'
union
select
	employee_id,
    first_name,
    last_name,
    position,
    'Not Consulting' AS Responsibility
from
	employee
where
	position not like '%Consultant%'
order by last_name;
