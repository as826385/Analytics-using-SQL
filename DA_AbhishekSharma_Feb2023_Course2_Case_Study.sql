-- Task 1 
select * from actor;


-- Task 2
select concat(first_name,' ',last_name) as full_name from actor;
select first_name, count(first_name) from actor group by first_name having count(*)>=1;
select last_name, count(last_name) from actor group by last_name having count(*)>=1;


-- Task 3
select rating,count(film_id) as count_of_movies from film where rating in ('G','R') group by rating;


-- Task 4
select rating , avg(rental_rate) as average_rental_rates from film where rating in ('PG-13','G') group by rating;


-- Task 5
select title as movie_title,replacement_cost from film where replacement_cost<=9;

select title as movie_title,replacement_cost from film where replacement_cost between 15 and 20;

select title as movie_title,replacement_cost,rental_rate from film order by replacement_cost desc, rental_rate asc;


-- Task 6
select film.title,count(actor.first_name) as number_of_actors from film 
left outer join film_actor on film.film_id=film_actor.film_id
left outer join actor on film_actor.actor_id=actor.actor_id group by title;


-- Task 7
select title from film where title like "k%" or title like "q%";


-- Task 8 
select actor.first_name,actor.last_name from film 
left outer join film_actor on film.film_id=film_actor.film_id
left outer join actor on film_actor.actor_id=actor.actor_id where title = 'agent truman';


-- Task 9 
select title from film left outer join film_category on film.film_id=film_category.film_id
left outer join category on film_category.category_id=category.category_id where name = 'family';


-- Task 10
select film.title,count(rental.rental_id) as no_of_copies from film inner join inventory on film.film_id=inventory.inventory_id 
inner join rental on inventory.inventory_id=rental.inventory_id group by title order by no_of_copies desc;


-- Task 11
create view view11 as 
select film.title,film.rental_rate,film.replacement_cost,film.film_id,category.category_id,category.name from film
left outer join film_category on film.film_id=film_category.film_id
left outer join category on film_category.category_id=category.category_id;

create view view11_1 as 
select avg(replacement_cost)-avg(rental_rate) as difference ,name from view11 group by name;

select count(name) as Number_of_movie_category from view11_1 where difference > 15;


-- Task 12
create view view12 as
select category.name,film_category.film_id from category left outer join 
film_category on category.category_id=film_category.category_id;

create view view12_1 as
select name,count(film_id) as no_of_movies from view12 group by name;

select * from view12_1 where no_of_movies between 60 and 70;

