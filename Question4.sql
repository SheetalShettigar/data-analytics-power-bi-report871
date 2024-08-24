create View new_question4 as
(Select dim_stores.store_type,
count((orders_powerbi."Order Date")) as "order_count",
sum((orders_powerbi."Product Quantity" * dim_products.sale_price)) as "total_sales",
sum((orders_powerbi."Product Quantity" * dim_products.sale_price)) as "percentage_of_total_sales"
from orders_powerbi, dim_products, dim_stores
where orders_powerbi.product_code = dim_products.product_code
and orders_powerbi."Store Code" = dim_stores."store code"
group by dim_stores.store_type)
