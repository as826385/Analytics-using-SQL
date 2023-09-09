-- Task 1 
use sakila;
select * from customer where active = 0;


-- Task 2
select first_name,last_name,email from customer where active = 0;


-- Task 3
select store_id from customer where active = 0;


-- Task 4
select title from film where rating = "PG-13";


-- Task 5
select title,rating,length from film where rating = "PG-13" order by length desc limit 3;


-- Task 6
select title,rental_duration from film order by rental_duration desc limit 1;


-- Task 7
select avg(rental_rate) as rental_cost from film;


-- Task 8
select sum(replacement_cost) as total_replacement_cost from film;


-- Task 9 animation-2 children-3
select * from film_category;
select * from category;

select category_id from category where name in ("animation", "children");

select count(*)category_id from film_category where category_id = 2;
select count(*)category_id from film_category where category_id = 3;