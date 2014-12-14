1.
select distinct agents.city
from agents

join orders
on orders.aid=agents.aid

join customers
on orders.cid=customers.cid
where customers.name='Tiptop'

2.
select distinct o.pid
from orders

join customers
on orders.cid = customers.cid

join agents
on customers.city = 'Kyoto'

join orders o
on o.aid = orders.aid

3.
select name
from customers
where cid NOT in (select cid from orders)

4.
select customers.name
from customers
left join orders
on customers.cid = orders.cid
where orders.cid is null

5.
select distinct customers.name, agents.name
from customers
join agents 
on customers.city = agents.city
join orders
on customers.cid = orders.cid AND agents.aid = orders.aid

6.
select customers.name, agents.name, customers.city
from customers
join agents
on customers.city = agents.city

7.
select customers.name, customers.city
from customers join 
	(select products.city, count(products.city) 
	from products
	group by products.city
	limit 1) 
	as uniqueProducts
	on customers.city = uniqueProducts.city