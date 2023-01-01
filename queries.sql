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