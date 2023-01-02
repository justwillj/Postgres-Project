--Requirement 1
SELECT stores.name, address.street, address.street2, address.city, address.state, address.zip
FROM stores
INNER JOIN address
ON address.id = stores.address_id
ORDER BY name ASC;

--Requirement 2


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