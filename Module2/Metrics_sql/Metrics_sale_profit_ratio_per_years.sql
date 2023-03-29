select year(Order_Date) year , sum(sales) sales,sum(profit) profit, round((sum(profit)/sum(Sales))*100) profit_ratio
from orders o 
group by year(Order_Date)
order by year