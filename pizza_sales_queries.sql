use pizza_db;
select * from pizza_sales;

-- Total revenue from pizza.
select sum(total_price) Total_revenue
from pizza_sales;

-- Average order value.
select sum(total_price)/count( distinct	order_id) Avg_Order_value
from pizza_sales;

-- Total Pizzas Sold.
select sum(quantity) Totl_pizzas_sld
from pizza_sales;

-- Total Orders placed.
select count(distinct order_id) Totl_Orders
from pizza_sales;

-- Average pizzas per order.
select cast(sum(quantity)as decimal(10,2))/cast(count( distinct order_id)as decimal(10,2)) Avg_pizza_order
from pizza_sales;		

-- Daily trend for total orders for each day.
select datename(dw, order_date) as order_day, count (distinct order_id) Total_orders		
from pizza_sales
group by datename(dw, order_date)
order by Total_orders desc;

-- Daily trend for total orders for each month.
select datename(month, order_date) order_month, count(distinct order_id) Total_orders
from pizza_sales 
group by datename(month,order_date)
order by Total_orders desc;

-- Trend for total orders based on each hour of the day 
select datepart(hour, cast(order_time as datetime)), count(distinct order_id) Total_orders
from pizza_sales
group by datepart(hour, cast(order_time as datetime))
order by Total_orders desc;

-- Total sales and percentage by pizza category 
select pizza_category,cast(sum(total_price)as decimal(10,2))Total_sales, cast(sum(total_price) *100 / (select sum(total_price) 
from pizza_sales)as decimal (10,2))Total_sales_perc
from pizza_sales
group by pizza_category ;

-- Total sales and percentage by pizza size
select pizza_size,cast(sum(total_price)as decimal(10,2))Total_sales, cast(sum(total_price) *100 / (select sum(total_price) 
from pizza_sales)as decimal(10,2))Total_sales_perc
from pizza_sales
group by pizza_size;

-- 5 best and worst selling pizzas with respect to revenue
-- Top 5
select top 5 pizza_name, sum(total_price)Total_revenue
from pizza_sales
group by pizza_name
order by total_sales desc;

-- Bottom 5
select top 5 pizza_name, sum(total_price)Total_revenue
from pizza_sales
group by pizza_name
order by Total_sales;

-- 5 best and worst selling pizzas with respect to quantity sold.
-- Top 5
select top 5 pizza_name, sum(quantity)Total_quantity
from pizza_sales
group by pizza_name
order by total_quantity desc;

-- Bottom 5
select top 5 pizza_name, sum(quantity)Total_quantity
from pizza_sales
group by pizza_name
order by total_quantity;
 


