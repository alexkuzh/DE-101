select Customer_ID , Customer_Name , sum(sales) sales
from orders o 
group by Customer_ID , Customer_Name
order by Customer_Name 