-- Task 1
create database if not exists stylexcarz_db;
use stylexcarz_db;


-- Task 2
create table salesperson (salespersonid int primary key,
						 salesperson_name varchar(50),
                         salesperson_city varchar(50),
                         commission_rate int); 
                         
create table customers (customerid int primary key,
					    c_firstname varchar(50),
                        c_lastname varchar(50),
                        c_city varchar(50),
                        c_rating int);
                        
create table orders (orderid int primary key,
                    amount int,
                    orderdate date,
                    salespersonid int,
                    customerid int,
                    foreign key(salespersonid) references salesperson(salespersonid),
                    foreign key(customerid) references customers(customerid)
                    );		
   
   
-- task 3           
insert into salesperson(salespersonid,salesperson_name,salesperson_city,commission_rate)
values(1001,"william","new york",12),
	  (1002,"liam","new jersey",13),
      (1003,"axelrod","san jose",10),
      (1004,"james","san diego",12),
      (1005,"fran","austin",26),
      (1007,"oliver","new york",15),
      (1008,"john","atlanta",2),
      (1009,"charles","new jersey",2);
      
insert into customers(customerid,c_firstname,c_lastname,c_city,c_rating)
values(2001,"anny","hoffman","new york",1),
	  (2002,"jenny","giovanni","new jersey",2),
	  (2003,"williams","liu","san jose",3),
      (2004,"harry","grass","san diego",3),
      (2005,"john","clemens","austin",4),
      (2006,"fanny","cisneros","new york",4),
      (2007,"jonathan","pereira","atlanta",3);
      
    
insert into orders(orderid,amount,orderdate,salespersonid,customerid)
values(3001,23,"2020-02-01",1009,2007),
	  (3002,20,"2021-02-23",1007,2007),
      (3003,89,"2021-03-06",1002,2002),
      (3004,67,"2021-04-02",1004,2002),
      (3005,30,"2021-07-30",1001,2007),
      (3006,35,"2021-09-18",1001,2004),
      (3007,19,"2021-10-02",1001,2001),
      (3008,21,"2021-10-09",1003,2003),
	  (3009,45,"2021-10-10",1009,2005);    
      
      
-- Task 4
select * from salesperson where commission_rate<15;
set sql_safe_updates=0;
update salesperson set commission_rate=15 where commission_rate<15;


-- Task 5
create database if not exists stylexcarz_db_bkp;
use stylexcarz_db_bkp;
create table orders_bkp as select * from stylexcarz_db.orders;


-- Task 6
use stylexcarz_db;
select customerid from orders group by customerid having count(*)>1;
-- now we know customer id with 2002 and 2007 have multiple order, now we will increase their rating by 3
update customers set c_rating = c_rating + 3 where customerid = 2002;
update customers set c_rating = c_rating + 3 where customerid = 2007;
