-- Task 1 --------------------------------------------------------------------

create view Task1 as
select employees.employee_id,departments.location_id from employees left outer join departments 
on employees.department_id=departments.department_id;

create view task1_1 as
select task1.employee_id,locations.city from task1 left outer join locations 
on task1.location_id=locations.location_id;

select count(employee_id) as Number_of_employees,city from task1_1 group by city order by Number_of_employees desc limit 5;


-- Task 2 -------------------------------------------------------------------

create view Task2 as
select employees.first_name,employees.last_name,employees.salary,employees.employee_id,departments.location_id,departments.department_name 
from employees left outer join departments on employees.department_id=departments.department_id;

create view task2_1 as
select task2.first_name,task2.last_name,task2.salary,task2.employee_id,task2.location_id,task2.department_name,locations.city,locations.country_id 
from task2 left outer join locations on task2.location_id=locations.location_id; 

create view task2_2 as
select task2_1.first_name,task2_1.last_name,task2_1.salary,task2_1.employee_id,task2_1.location_id,task2_1.department_name,task2_1.city,task2_1.country_id,countries.country_name
from task2_1 left outer join countries on task2_1.country_id=countries.country_id;

-- now using below query we can see people who were working on city = London,Munich,Null were not present on Task 1 So we will exclude these people & get our result.
select count(employee_id) as Number_of_employees,city from task1_1 group by city order by Number_of_employees desc;

select * from task2_2 where not city = "london" and not city = "munich" and not city = "null";


-- Task 3 ----------------------------------------------------------------------

create view task3 as
select count(employee_id) as Number_of_employees,city from task2_2 group by city order by Number_of_employees;

select * from task3 where number_of_employees<10;


-- Task 4-------------------------------------------------------------------------

create view task4 as 
select task2_2.city,task2_2.employee_id,employees.hire_date from task2_2 left outer join employees
on task2_2.employee_id=employees.employee_id;

-- now we know 4 cities were identified on task 3 and one of citu was null so we will take employee_id of that candidate to see hire date.
create view task4_1 as
select year(current_date())-year(hire_date) as years_of_exp from task4 where city = 'london' or city = 'munich' or city = 'toronto' or city = 'southlake' or employee_id = 178;

select avg(years_of_exp) from task4_1;


-- Task 5 ------------------------------------------------------------------------

create view task5 as
select task2_2.first_name,task2_2.last_name,task2_2.city,employees.email,employees.phone_number,employees.hire_date from task2_2 left outer join employees
on employees.employee_id=task2_2.employee_id;

create view task5_1 as
select * from task5 where city = 'south san francisco' or city = 'oxford' or city = 'seattle' or city = 'southlake' or city = 'toronto';

select first_name,last_name,email,phone_number from task5_1 where year(current_date())-year(hire_date)>=10;


-- Task 6 -----------------------------------------------------------------------------

select manager_id,first_name,last_name,email,phone_number from employees where phone_number in 
(select phone_number from task5_1 where year(current_date())-year(hire_date)>=10);


