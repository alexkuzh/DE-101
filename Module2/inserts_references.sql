/* delete null*/
update orders 
set postal_code = 0
where postal_code is null 

/*insert region*/
insert into region (region_name) 
(select distinct region
from orders)

/*update people*/
update people 
set region_id  = r.region_id 
from region r
where region = r.region_name  
/*then drop column region*/
ALTER TABLE public.people DROP COLUMN region;

/*insert category*/
insert into category (category_name)
(select distinct category 
from orders)

/*insert subcategory*/
insert into subcategory (subcategory_name,category_id)
(select distinct o.subcategory, category_id  
from orders o inner join category c
on o.category=c.category_name)

/*insert product*/
insert into product (product_name, product_ident, subcategory_id) 
(select distinct product_name,product_id ,s.subcategory_id  
from orders o 
inner join subcategory s 
on o.subcategory =s.subcategory_name)

/*insert state*/
insert into state (state_name, region_id)
(select distinct state,region_id
from orders o
inner join region r 
on o.region = r.region_name )

/* insert city */
insert into city (city_name, zip_code, state_id)
(select distinct city,postal_code, s.state_id 
from orders o
inner join state s
on o.state =s.state_name )

/*insert segment*/
insert into segment (segment_name)
(select distinct segment 
from orders o)

/*insert customer */
insert into customer (customer_id, customer_name, segment_id)
(select distinct customer_id ,customer_name, segment_id  
from orders o inner join segment s
on o.segment=s.segment_name)

/*insert ship_mode)*/
insert into ship_mode (ship_mode_name)
(select distinct ship_mode  
from orders )

/*insert order_table*/
insert into order_table (order_date, ship_date, ship_mode_id, order_ident)
(select distinct order_date, ship_date, s.ship_mode_id , order_id
from orders o
inner join ship_mode s 
on o.ship_mode =s.ship_mode_name 
)

/* insert main_orders*/
insert into main_orders (order_table_id,customer_id,segment_id,country,city_id,product_id,sales,quantity,discount,profit,people_id)
(select ot.order_table_id , o. customer_id , s.segment_id ,country, c.city_id, p.product_id ,sales,quantity ,discount ,profit, pe.people_id   
from orders o
left outer join order_table ot 
	on o.order_id = ot.order_ident 
left outer join segment s 
	on o.segment = s.segment_name 
left outer join city c 
	on o.city = c.city_name and o.postal_code=c.zip_code 
left outer join product p 
	on o.product_id =p.product_ident and  o.product_name = p.product_name 
left outer join state st
	on c.state_id  = st.state_id 
left outer join people pe
	on st.region_id = pe.region_id 
order by row_id
)