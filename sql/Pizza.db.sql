SELECT
	order_date,
	count(DISTINCT order_id) as customer_per_day
from orders
GROUP BY order_date
order by order_date


-- avg pizza per orders
select 
	AVG(pizza_count) AS avg_pizzas_per_order
FROM (
	SELECT
  		order_id,
  		SUM(quantity) as pizza_count
  from order_details
  group by order_id
    );
    
    
    -- best seller
    SELECT
    	name,
        SUM(quantity) total_sold
   FROM order_details od
   JOIN pizzas p on od.pizza_id = p.pizza_id
   JOIN pizza_types pt on p.pizza_type_id = pt.pizza_type_id 
   group by pt.name
   order by total_sold DESC
   limit 10;
   
   
   -- Revenue
   SELECT 
   	SUM(od.quantity*p.price) total_revenue
  FROM order_details od 
  JOIN pizzas p on od.pizza_id = p.pizza_id;
  
  -- worset seller
   SELECT
    	name,
        SUM(quantity) total_sold
   FROM order_details od
   JOIN pizzas p on od.pizza_id = p.pizza_id
   JOIN pizza_types pt on p.pizza_type_id = pt.pizza_type_id 
   group by pt.name
   order by total_sold ASC
   limit 5;
   
   
   -- best revenue 
   SELECT
    	name,
       	SUM(od.quantity*p.price) total_revenue
   FROM order_details od
   JOIN pizzas p on od.pizza_id = p.pizza_id
   JOIN pizza_types pt on p.pizza_type_id = pt.pizza_type_id 
   group by pt.name
   order by total_revenue DESC
   limit 5;
   
   
   -- seasonality
SELECT
    	strftime('%m', o.order_date) as month,
       	SUM(od.quantity*p.price) total_revenue
   FROM orders o
   JOIN pizzas p on od.pizza_id = p.pizza_id
   JOIN order_details od ON o.order_id = od.order_id
   group by month
   order by month;