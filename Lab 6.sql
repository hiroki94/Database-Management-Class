1. 
select c.name, c.city
from customers as c
inner join (select p.city, count(p.city)
		from products as p
		group by p.city
		having count(p.city) > 1
		order by count(p.city) desc
		limit 1) as diffProducts
		on c.city = diffProducts.city

2.
create view diffProdView as 
select max(diffProducts.prodCount) as maxProdCount
from (select p.city, count(p.city) as prodCount
	from products as p
	group by p.city
	having count(p.city) > 1
	order by count(p.city) desc) as diffProducts;
 
select c.name, c.city
from diffProdView
inner join (select p.city, count(p.city) as prodCount
		from products as p
		group by p.city
		having count(p.city) > 1
		order by count(p.city) desc) as diffProducts2

on diffProdView.maxProdCount = diffProducts2.prodCount
inner join customers as c
on c.city = diffProducts2.city

3.
select name, priceUSD
from products
where products.priceUSD > (select avg(products.priceUSD) from products)

4.
select c.name, o.cid, o.pid, o.dollars
from orders as o
inner join customers as c
on c.cid = o.cid
order by o.dollars asc

5.
select coalesce(c.name), coalesce(sum(o.dollars))
from orders as o
inner join customers as c
on c.cid = o.cid
group by name
order by name asc

6.
select c.name, p.name, a.name 
from orders as o

inner join customers as c
on c.cid = o.cid

inner join products as p
on p.pid = o.pid

inner join agents as a
on a.aid = o.aid

where o.aid in (select  a.aid
		 from orders as o
		 inner join agents as a
		 on a.aid = o.aid
		 where a.city = 'New York')

7.
select * from orders 
where dollars not in 
(select round(qty * priceUSD - (qty * priceUSD * 0.01 * discount), 2) as d
from orders as o
join customers as c
on o.cid = c.cid
join products as p
on o.pid = p.pid)