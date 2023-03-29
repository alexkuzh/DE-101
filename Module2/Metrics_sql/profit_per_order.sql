select Order_ID, sum(profit) profit
from orders o 
group by Order_ID
order by Order_ID 