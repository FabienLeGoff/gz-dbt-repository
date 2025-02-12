WITH sub_ship AS (
    SELECT *
    FROM {{ ref("int_sales_margin") }}
    JOIN {{ ref("stg_raw__ship") }}
    USING (orders_id)
)

SELECT
    orders_id,
    date_date,
    revenue,
    quantity,
    purchase_cost,
    shipping_fee,
    logcost,
    ship_cost,
    margin,
    ROUND((margin+shipping_fee-logcost-ship_cost),2) AS operational_margin
FROM sub_ship
ORDER BY orders_id DESC

