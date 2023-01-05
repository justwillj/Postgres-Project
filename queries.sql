--Requirement 1
/*CODE REVIEW: make sure to Alias your column names to give your report some uniformity */
SELECT stores.name, address.street, address.street2, address.city, address.state, address.zip
FROM stores
INNER JOIN address
ON address.id = stores.address_id
ORDER BY name ASC;

--Requirement 2
/*CODE REVIEW: AWESOME JOB USING CAST! */
SELECT stores.name, CAST (SUM(items.price) AS MONEY) as total_sales
FROM stores
INNER JOIN purchases
ON stores.id = store_id
INNER JOIN purchase_items
ON purchases.id = purchase_id
INNER JOIN items
ON items.id = item_id
GROUP BY stores.name
ORDER BY stores.name;

--Requirement 3
/*CODE REVIEW: these column names are ambiguious */
SELECT stores.name, customers.first_name, customers.last_name
FROM stores
INNER JOIN customers
ON stores.id = store_id
ORDER BY name ASC;

--Requirement 4
SELECT stores.name as store_name, items.name as item_name, inventory.quantity, items.price, items.notes
FROM stores
INNER JOIN inventory
ON stores.id = store_id
INNER JOIN items
ON items.id = item_id
WHERE stores.name = 'Administaff, Inc.';

--Requirement 5
SELECT EXTRACT (MONTH FROM purchases.purchase_date) AS month, CAST (SUM(items.price) AS MONEY) as total_sales
FROM stores
INNER JOIN purchases
ON stores.id = store_id
INNER JOIN purchase_items
ON purchases.id = purchase_id
INNER JOIN items
ON items.id = item_id
WHERE stores.name = 'Administaff, Inc.'
GROUP BY purchases.purchase_date
ORDER BY month ASC;


--Requirement 6
/*CODE REVIEW: this query is returing incorrect information */
SELECT stores.name as store_name, payment_types.payment_method, COUNT(payment_types.payment_method)
FROM stores
INNER JOIN purchases
ON stores.id = store_id
INNER JOIN purchase_items
ON purchases.id = purchase_id
INNER JOIN payment_types
ON payment_types.id = payment_type_id
WHERE stores.name = 'Benchmark Electronics, Inc.'
GROUP BY stores.name, payment_types.payment_method
ORDER BY payment_types.payment_method;

--Requirement 7
SELECT stores.name as store_name, items.name as item_name, inventory.quantity
FROM stores
INNER JOIN inventory
ON stores.id = store_id
INNER JOIN items
ON items.id = item_id
WHERE inventory.quantity < 10
ORDER BY stores.name;

--Requirement 8
SELECT customers.first_name, customers.last_name, purchases.purchase_date, items.name as item_name, payment_types.payment_method, purchase_items.quantity
FROM customers
INNER JOIN purchases
ON customers.id = customer_id
INNER JOIN payment_types
ON payment_types.id = purchases.payment_type_id
INNER JOIN purchase_items
ON purchases.id = purchase_id
INNER JOIN items
ON items.id = item_id
WHERE customers.first_name ='Alfred' AND customers.last_name = 'Poggi'
ORDER BY purchases.purchase_date DESC;

--Requirement 9
/*CODE REVIEW: query uses hardcoded ids */
UPDATE purchases 
SET payment_type_id = 3
WHERE payment_type_id = 5;

--Requirement 10
DELETE FROM payment_types
WHERE payment_method = 'apple pay';

--Requirement 11
INSERT INTO items (name,price,notes) VALUES
	('Frosted Flakes',5,'They’re Grate');

--Requirement 12
INSERT INTO inventory (store_id,item_id,quantity)
VALUES 
/*CODE REVIEW: query uses hardcoded ids. Also while this query works for this particular 
subset of data, what happens if this is used in another database that has more stores with a's in their name? YOu want to make your querires work for larger data.*/
(8,56,50),
(9,56,50),
(15,56,50),
(16,56,50),
(17,56,50),
(18,56,50)

--Requirement 13
UPDATE items SET notes = 'They’re Gr-r-reat!'
WHERE items.name = 'Frosted Flakes';
