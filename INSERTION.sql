--CREER UNE COMMANDE DE 3 ARTICLES DIFFERENTS
INSERT INTO orders (number, date, total, customer_id) VALUES (312578951, NOW(), 1010, 3);
INSERT INTO order_product (order_id, product_id, quantity) VALUES (6,9,1), (6,11,1), (6,13,1);

--AJOUTER UN PRODUIT ET SA CATEGORIE
INSERT INTO products (name, description, price, weight, quantity, available, picture, categorie_id)
VALUES ('serrure sans trou', 'Avec notre serrure sans trou vous n''avez plus besoin de cléf pour ne pas fermer votre porte', 150, 250, 5, 1, 'serrure.jpg', 3);

-- AJOUTER 100 à la quantité en stock d'un produit
UPDATE products SET quantity=quantity+100 WHERE id=12;

--AUGMENTER 5% le prix des produits d'une catégorie
UPDATE products SET price=price*1.05 WHERE categorie_id=3

--SUPPRIMER UN ARTICLE
DELETE FROM products WHERE id=13

--SUPPRIMER CLIENT SANS COMMANDE
DELETE c
FROM customers c
LEFT JOIN orders o
ON c.id = o.customer_id
WHERE o.number IS NULL

-----------------EN PLUS---------------
--LISTER CLIENT QUI ONT COMMANDER TODAY
SELECT *
FROM customers c
INNER JOIN orders o
ON c.id = o.customer_id
WHERE DATE(o.date) = DATE(NOW());

--MONTANT TOTAL DES STOCKS
SELECT SUM(p.quantity*p.price)
FROM products p

-- LISTE TOUTES LES COMMANDES NE CONTENANT PAS UN PRODUIT
SELECT DISTINCT order_id FROM order_product
WHERE NOT order_id = ANY (SELECT order_id FROM order_product WHERE product_id=13)

--LISTER CATEGORIE DONT TOUS ARTICLE SONT DISPO
SELECT name
FROM categories
WHERE NOT id = ANY(SELECT categorie_id FROM products WHERE available=0)

--LISTER CATEGORIE DONT UN ARTICLE EST AU MOINS DISPO
SELECT name
FROM categories
WHERE NOT id = ANY(SELECT categorie_id FROM products WHERE available=0 OR quantity=0)
