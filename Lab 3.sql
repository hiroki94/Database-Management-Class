--List the name and city of agents named Bond
select name, city
from agents
where name = 'Bond';

--List pid, name, and quantity of products costing more than US$0.99
select pid, name, quantity
from products
where priceusd > 0.99;

--List the ordno and qty of all orders
select ordno, qty
from orders;

--List the names and cities of customers in Duluth
select name, city
from customers
where city = 'Duluth’;

--List the names of agents not in New York and not in London
select name, city
from agents
where city != 'New York' and city != 'London';

--List all data for products not in Dallas or Duluth that cost US$1 or less
select *
from products
where city not in ('Dallas', 'Duluth') and priceusd <= 1;

--List all data for orders in January or April
select *
from orders
where mon = 'jan' or mon = 'apr';

--List all data for orders in February more than US$200
select *
from orders
where mon = 'feb' and dollars > 200;

--List all orders from the customer whose cid is C005
select *
from orders
where cid = 'c005';
