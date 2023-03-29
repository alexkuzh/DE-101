select year(Order_Date) year , round(avg(Discount)*100,1) discount
from orders o 
group by year(Order_Date)
order by year