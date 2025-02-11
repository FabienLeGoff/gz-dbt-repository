SELECT
    date_date,
    COUNT(orders_id) AS nb_transactions,
    SUM(revenue * quantity) AS tot_revenue,
    AVG(quantity) AS avg_basket,
    SUM(operational_margin) AS operational_margin,
    SUM(purchase_cost) AS tot_purchase_cost,
    SUM(shipping_fee) AS tot_shipping_fee,
    SUM(logcost) AS tot_logcost
FROM {{ ref("int_orders_operational") }}
GROUP BY date_date
ORDER BY date_date