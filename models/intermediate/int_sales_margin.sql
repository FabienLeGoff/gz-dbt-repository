SELECT
orders_id
,date_date
,quantity
,purchase_price
,revenue
,(purchase_price * quantity) AS purchase_cost
,ROUND((revenue-(purchase_price * quantity)),2) AS Margin
FROM {{ ref('stg_raw__sales') }} AS a
LEFT JOIN {{ ref('stg_raw__product') }} AS b
USING (products_id)