-- Task 1
create view Task_1 as
select departments.department_id,departments.department_name,employees.employee_id,employees.first_name,employees.last_name 
from employees left outer join departments on employees.department_id=departments.department_id;
select * from Task_1 where department_name = "IT";


-- Task 2
create view Task_2 as
select departments.department_name,employees.salary from employees left outer join departments
on employees.department_id=departments.department_id;
select max(salary),min(salary),department_name from task_2 group by department_name;


-- Task 3
create view Task_3 as
select employees.employee_id,departments.location_id,locations.city from employees left outer join departments 
on employees.department_id=departments.department_id left outer join locations
on departments.location_id=locations.location_id;
select count(employee_id) as 'No. of employee',city from Task_3 group by city limit 10;


-- Task 4
create view Task_4 as
select employees.employee_id,employees.first_name,employees.last_name,job_history.end_date 
from employees left outer join job_history on employees.employee_id=job_history.employee_id;
select * from Task_4 where end_date = '1999-12-13';


-- Task 5

create view Task_5 as
select employees.hire_date,employees.employee_id,employees.first_name,departments.department_name from employees 
left outer join departments on employees.department_id=departments.department_id;
select * ,year(current_date() - hire_date) as Years from task_5 where current_date() - hire_date > 25;
