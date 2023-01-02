--Requirement 1
SELECT stores.name, address.street, address.street2, address.city, address.state, address.zip
FROM stores
INNER JOIN address
ON address.id = stores.address_id
ORDER BY name ASC;

--Requirement 2
SELECT stores.name, SUM(purchases.customer_id)
FROM stores
INNER JOIN purchases
ON stores.id = store_id
INNER JOIN purchase_items
ON purchases.id = purchase_id;

--Requirement 3
SELECT stores.name, customers.first_name, customers.last_name
FROM stores
INNER JOIN customers
ON stores.id = store_id
ORDER BY name ASC;

--Requirement 4
SELECT stores.name, items.name, inventory.quantity, items.price, items.notes
FROM stores
INNER JOIN inventory
ON stores.id = store_id
INNER JOIN items
ON items.id = item_id
WHERE stores.id = 16;

--Requirement 5
SELECT purchases.purchase_date, SUM(items.price)
FROM stores
INNER JOIN purchases
ON stores.id = store_id
INNER JOIN purchase_items
ON purchases.id = purchase_id
INNER JOIN items
ON items.id = item_id
WHERE stores.id = 16
GROUP BY purchases.purchase_date
ORDER BY purchase_date ASC;

--Requirement 6
SELECT stores.name, payment_types.payment_method, COUNT(payment_types.payment_method)
FROM stores
INNER JOIN purchases
ON stores.id = store_id
INNER JOIN purchase_items
ON purchases.id = purchase_id
INNER JOIN payment_types
ON payment_types.id = payment_type_id
WHERE stores.id = 15
GROUP BY stores.name, payment_types.payment_method
ORDER BY payment_types.payment_method;