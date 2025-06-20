select * from df_orders;

--Find top 10 revenue generating products( if category and sub_category are
--same then assume it as same product) ?

with cte as(
select category ,sub_category ,sum(amount) as revenue, dense_rank() 
over (partition by category ,sub_category order by sum(amount) desc ) as rnk
from df_orders
group by category, sub_category)

select category ,sub_category,revenue
from cte 
where rnk<11;

-- find top 5 most selling sub_category in each city?

with cte as 
(select city, sub_category, count(*) as items_sold, dense_rank() over(partition by city
order by count(*) desc) as rnk
from df_orders
group by city,sub_category)
select city , sub_category, items_sold
from cte
where rnk<6;

--find month over month growth comparision for 2023 and 2024 amount eg: jan 2023 vs jan 2024---(pivot using case statement)
with cte as
(select extract(year from order_date) as order_year, extract(month from order_date) as order_month,
sum(amount) as sales
from df_orders
group by extract(year from order_date) , extract(month from order_date))

select order_month, 
sum(case when order_year=2023 then sales else 0 end) as sales_2023 ,
sum(case when order_year=2024 then sales else 0 end) as sales_2024
from cte
group by order_month
order by order_month;

--for each category which month has highest sales?
--(consider jan 2023 as 1st month and jan 2024 as 13th till dec 2024 as 24th month)
with cte as
(select category, month,sum(amount) as sales, dense_rank() over( partition by category order by sum(amount) desc) as rnk
from ( select category,amount,
case when extract(year from order_date) =2023 then extract(month from order_date) 
when extract(year from order_date) =2024 then extract(month from order_date)+12  end as month
from df_orders
where extract(YEAR FROM order_date) IN (2023, 2024))
group by category,month)
select category,month, sales 
from cte 
where rnk=1;

---which sub category had highest growth by profit in 2024 compared to 2023?

with year as
	( select sub_category,extract(year from order_date) as order_year , sum(amount) as sales
	from df_orders
	group by sub_category,extract(year from order_date)),
sales_by_year as
	(select sub_category, sum( case when order_year =2023 then sales else 0 end) as sales_2023,
	sum( case when order_year =2024 then sales else 0 end) as sales_2024
	from year
	group by sub_category)
select *,(sales_2024-sales_2023)*100/sales_2023 as profit_per
from sales_by_year
order by profit_per desc
limit 1;
