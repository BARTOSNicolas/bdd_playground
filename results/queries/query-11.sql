SELECT c.first_name, c.last_name, SUM(o.quantity*p.price) AS total_price
FROM order_product o
INNER JOIN products p
ON o.product_id = p.id
INNER JOIN orders os
ON o.order_id = os.id
RIGHT JOIN customers c
ON os.customer_id = c.id
GROUP BY c.first_name, c.last_name
