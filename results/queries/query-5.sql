SELECT p.name, o.quantity, p.price
FROM products p
INNER JOIN order_product o
ON p.id = o.product_id
WHERE o.order_id = 1;
