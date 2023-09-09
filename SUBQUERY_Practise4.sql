-- Task_1 ----------------------------------------------
select first_name,last_name,employee_id, (select department_name from departments where employees.department_id=departments.department_id) as department from employees;


-- Task 2 (2 solution both have same answers)
select first_name,last_name,salary,department_id from employees where salary > (select avg(salary) from employees);

select first_name,last_name,salary,department_id from employees where salary > 
(select avg(salary) from employees where department_id = employees.department_id) group by department_id,first_name,last_name,salary;


-- Task 3---------------------------------------------------
select first_name,last_name,salary from employees where department_id in (select department_id from departments where department_name = 'sales') and 
salary < (select avg(salary) from employees where department_id in (select department_id from departments where department_name = 'sales'));


-- Task 4-------------------------------------------------------
select first_name,last_name,salary from employees where salary > (select max(salary) from employees where job_id = 'IT_PROG') order by salary asc;


-- Task 5----------------------------------
select min(salary) as minimum_salary,job_id from employees group by job_id order by minimum_salary asc;


-- Task 6-------------------------------------------
select first_name,last_name,department_id,salary from employees where 
salary > 0.6*(select sum(salary) from employees e2 where e2.department_id = employees.department_id);


-- Task 7-------------------------------------
select first_name,last_name from employees where manager_id in
(select manager_id from departments where location_id in (select location_id from locations where country_id = 'UK'));


-- Task 8---------------------------------------------
select first_name,last_name,salary from employees order by salary desc limit 5
into outfile 
'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\practise4sql.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';














