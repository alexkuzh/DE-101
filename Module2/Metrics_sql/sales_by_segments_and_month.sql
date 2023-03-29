select month(Order_Date) month , Segment , sum(sales) sales
from orders o 
group by month(Order_Date),Segment 
order by Segment , month 