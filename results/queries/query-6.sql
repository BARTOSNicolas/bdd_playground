SELECT os.number, SUM(o.quantity*p.price) AS total_price
FROM order_product o
INNER JOIN products p
ON o.product_id = p.id
INNER JOIN orders os
ON o.order_id = os.id
GROUP BY os.number
