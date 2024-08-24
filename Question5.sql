Select dim_products.category as "highest_profit_product_category",
sum((dim_products.sale_price - dim_products.cost_price )) as "profit"
from orders_powerbi, dim_products, dim_stores
where orders_powerbi.product_code = dim_products.product_code
and orders_powerbi."Store Code" = dim_stores."store code"
and orders_powerbi."Order Date" is not NULL
and SUBSTRING(orders_powerbi."Order Date",1,4) = '2021'
and dim_stores.country_code = 'GB'
and dim_stores.country_region = 'Wiltshire'
group by dim_products.category
order by profit desc limit 1