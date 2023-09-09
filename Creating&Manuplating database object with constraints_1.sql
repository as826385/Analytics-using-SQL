-- Task 1
create database if not exists techmac_db;
use techmac_db;


-- Task 2
create table techhyve_employees(employee_id int primary key,
							    first_name varchar(50),
                                last_name varchar(50),
                                gender varchar(50),
                                age int check(age>21 and age<55));
                                
create table techcloud_employees(employee_id int primary key,
							    first_name varchar(50),
                                last_name varchar(50),
                                gender varchar(50),
                                age int check(age>21 and age<55));
                                
create table techsoft_employees(employee_id int primary key,
							    first_name varchar(50),
                                last_name varchar(50),
                                gender varchar(50),
                                age int check(age>21 and age<55));

-- employee_id must be in varchar because id is TH0001 SO below is modification of employee id.
alter table techhyve_employees
modify employee_id varchar(50);
alter table techcloud_employees
modify employee_id varchar(50);
alter table techsoft_employees
modify employee_id varchar(50);
             
-- Task 3
alter table techhyve_employees add communication_proficiency int;
alter table techcloud_employees add communication_proficiency int;
alter table techsoft_employees add communication_proficiency int;

alter table techhyve_employees
add constraint chk_key check(communication_proficiency>=1 and communication_proficiency<=5);
alter table techhyve_employees
modify communication_proficiency int default "1";

alter table techcloud_employees
add constraint check(communication_proficiency>=1 and communication_proficiency<=5);
alter table techcloud_employees
modify communication_proficiency int default "1";


alter table techsoft_employees
add constraint check(communication_proficiency>=1 and communication_proficiency<=5);
alter table techsoft_employees
modify communication_proficiency int default "1";


-- Task 4 

insert into techhyve_employees(employee_id,first_name,last_name,gender,age,communication_proficiency)
values("TH0001","ELI","EVANS","MALE","26","1"),
	  ("TH0002","CARLOS","SIMMONS","MALE",32,2),
      ("TH0003","KATHIE","BRYANT","FEMALE",25,1),
      ("TH0004","JOEY","HUGHES","MALE",41,4),
      ("TH0005","ALICE","MATTHEWS","FEMALE",52,4);

insert into techcloud_employees(employee_id,first_name,last_name,gender,age,communication_proficiency)
values("TC0001","TERESA","BRYANT","FEMALE",39,2),
	  ("TC0002","ALEXIS","PATTERSON","MALE",48,5),
      ("TC0003","ROSE","BELL","FEMALE",42,3),
      ("TC0004","GEMMA","WATKINS","FEMALE",44,3),
      ("TC0005","KINGSTON","MARTINEZ","MALE",29,2);
      
insert into techsoft_employees(employee_id,first_name,last_name,gender,age,communication_proficiency)
values("TS0001","PETER","BURTLER","MALE",44,4),
	  ("TS0002","HAROLD","SIMMONS","MALE",54,4),
      ("TS0003","JULIANA","SANDERS","FEMALE",36,2),
      ("TS0004","PAUL","WARD","MALE",29,2),
      ("TS0005","NICOLE","BRYANT","FEMALE",30,2);
      

-- Task 5
   create database if not exists backup_techmac_db;
use backup_techmac_db;

create table techhyve_employees_bkp as select * from techmac_db.techhyve_employees;
create table techcloud_employees_bkp as select * from techmac_db.techcloud_employees;
create table techsoft_employees_bkp as select * from techmac_db.techsoft_employees;


-- Task 6
use techmac_db;
delete from techhyve_employees where employee_id = "th0003";
delete from techhyve_employees where employee_id = "th0005";
delete from techcloud_employees where employee_id = "tc0001";
delete from techcloud_employees where employee_id = "tc0004";


-- Task 7
create table techhyvecloud_employees
as select * from techhyve_employees union all select * from techcloud_employees;
truncate table techhyve_employees;
truncate table techcloud_employees;
