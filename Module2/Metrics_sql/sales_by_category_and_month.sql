select month(Order_Date) month , Category  , sum(sales) sales
from orders o 
group by month(Order_Date),Category 
order by Category , month 