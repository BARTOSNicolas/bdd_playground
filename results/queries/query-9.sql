SELECT os.number, SUM(o.quantity*p.price) AS total_price
FROM order_product o
INNER JOIN products p
ON o.product_id = p.id
INNER JOIN orders os
ON o.order_id = os.id
INNER JOIN customers c
ON os.customer_id = c.id
WHERE c.first_name = 'Charlize'
GROUP BY os.number
