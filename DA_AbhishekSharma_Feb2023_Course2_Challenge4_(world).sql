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








