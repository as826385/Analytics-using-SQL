-- Task 1---------
select * from country;
select count(name) from country;    -- or we can do this also =  select *, count(*)over() as no_of_rows from country;
select name,population from country where code in ('usa','gbr','are');


-- Task 2-------------
select continent,sum(population) as population_of_continent from country group by continent order by population_of_continent desc;


-- Task 3------------
select name  from country where continent = 'europe' and  code in 
(select countrycode as code from countrylanguage where language = 'french');


-- Task 4-----------------
select name,continent,population from country where population in 
(select max(population) from country group by continent) order by population desc;

-- 

-- Task 1----------------
select film_id,count(film_id) as number_of_copies from inventory where film_id in 
(select film_id from film where title in ('brotherhood blanket','soup wisdom')) group by film_id;


-- Task 2-----------------------
create view view1 as
select category.category_id,category.name,film_category.film_id from category left outer join film_category on category.category_id=film_category.category_id;

select name as genre,count(film_id) as no_of_film from view1 group by genre;


-- Task 3
select first_name,last_name from actor where actor_id in 
(select actor_id from film_actor where film_id in (select film_id from film order by replacement_cost desc)) limit 3;


-- Task4-----------------
select category.name as Genre,sum(payment.amount) as total_sales from category inner join film_category 
on category.category_id=film_category.category_id inner join
inventory on inventory.film_id=film_category.film_id inner join
rental on inventory.inventory_id=rental.inventory_id inner join
payment on rental.rental_id=payment.rental_id group by Genre;


-- Task5 ----------------------------
select category.name as Genre,sum(payment.amount) as total_sales from category inner join film_category 
on category.category_id=film_category.category_id inner join
inventory on inventory.film_id=film_category.film_id inner join
rental on inventory.inventory_id=rental.inventory_id inner join
payment on rental.rental_id=payment.rental_id group by Genre order by total_sales desc limit 10

INTO OUTFILE
'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\task5.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';





