-- Task 1
select count(employee_id) as number_of_employees from employees;


-- Task 2
select count(*)employee_id,department_id from employees group by department_id;


-- Task 3
select first_name,last_name,salary from employees where salary>6000;


-- Task 4
select count(employee_id) from employees where salary>20000;


-- Task 5
select * from employees where commission_pct is not null;


-- Task 6
select concat(first_name,' ',last_name) as full_name from employees where commission_pct is not null;


-- Task 7
select employee_id as 'Employee ID',
concat(first_name,' ',last_name) as 'Employee Full name',
email as 'Email ID',
phone_number as 'Phone Number'
from employees where commission_pct is not null;


-- Task 8 
select sum(salary) as Total_Salary ,department_id from employees group by department_id order by Total_salary desc limit 3;


-- Task 9
select * from employees where department_id in (select department_id from departments where department_name = 'IT');


-- Task 10
select count(employee_id) as 'Number of IT Employee', floor(avg(salary)) as 'average salary' from employees where department_id in (select department_id from departments where department_name = 'IT');


-- task 11
select department_id, count(employee_id) as 'Number of employee' from employees where salary between '7000' and '10000' group by department_id;






