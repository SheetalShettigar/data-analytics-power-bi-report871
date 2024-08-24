Select highest_revenue_month, round(sum(total_revenue)) as "total_revenue" FROM
(Select SUBSTRING(orders_powerbi."Order Date",6,2) as "highest_revenue_month",
sum((orders_powerbi."Product Quantity" * dim_products.sale_price)) as "total_revenue"
from orders_powerbi, dim_products
where orders_powerbi.product_code = dim_products.product_code
and orders_powerbi."Order Date" is not NULL
and SUBSTRING(orders_powerbi."Order Date",1,4) = '2022'
group by orders_powerbi."Order Date",orders_powerbi.product_code)
group by highest_revenue_month
order by total_revenue desc limit 1




