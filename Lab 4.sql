--Get the cities of agents booking an order for customer “TipTop”
select city
from agents
where aid in (
	select aid
	from orders
	where cid = (
		select cid
		from customers
		where name = 'Tiptop'
		)
	)

--Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto
select pid
from orders 
where aid in (
	select aid
	from orders
	where cid in (
		select cid 
		from customers
		where city = 'Kyoto'
		)
	);

--Find the cids and names of customers who never placed an order through agent a04
select cid,name
from customers
where cid not in(
	select cid
	from orders
	where aid = 'a04'
	);

--Get the cids and names of customers who ordered both product p01 and p07
select cid,name
from customers
where cid in (
	select cid
	from orders
	where cid in (
		select cid
		from orders
		where pid = 'p07'
		)

	AND pid = 'p01'
	);

--Get the pids of products ordered by any customers who ever placed an order through agent a04
select pid
from orders
where cid in (
	select cid 
	from orders
	where aid = 'a04'
	);

--Get the names and discounts of all customers who place orders through agents in Dallas or Newark
select name, discount
from customers
where cid in (
	select cid
	from orders
	where aid in (
		select aid
		from agents
		where city = 'Dallas' or city = 'Newark'
		)
	);

--Find all customers who have the same discount as that of any customers in Dallas or Kyoto
select *
from customers
where discount in (
	select discount
	from customers
	where cid in (
		select cid 
		from customers
		where city = 'Dallas' OR city = 'Kyoto'
		)
	);
