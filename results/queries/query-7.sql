SELECT SUM(o.quantity*p.price) AS total_price_today
FROM order_product o
INNER JOIN products p
ON o.product_id = p.id
INNER JOIN orders os
ON o.order_id = os.id
WHERE DATE(os.date) = DATE(NOW());


