# Lab | SQL Join

use sakila;

#1 List number of films per category.
select film.category_id, cat.name, count(film_id) as total_film from sakila.category cat
join sakila.film_category film
on cat.category_id=film.category_id
group by film.category_id, cat.name;

#2 Display the first and last names, as well as the address, of each staff member.
select staff_id, first_name, last_name, address_id from sakila.staff
group by staff_id;

#3 Display the total amount rung up by each staff member in August of 2005.
select s.staff_id, s.first_name, s.last_name, sum(p.amount) as total_amount from sakila.staff s
join sakila.payment p
on s.staff_id=p.staff_id
where p.payment_date >= 20050801 and p.payment_date <= 20050831
group by staff_id;

#4 List each film and the number of actors who are listed for that film.
select film.film_id, film.title, count(actor.actor_id) as total_actor from sakila.film film
join sakila.film_actor actor
on film.film_id=actor.film_id
group by film.film_id;

#5 Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
#List the customers alphabetically by last name.
select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total_paid from sakila.customer c
join sakila.payment p
on c.customer_id = p.customer_id
group by c.customer_id order by c.last_name;

