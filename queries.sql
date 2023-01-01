--Requirment 1 
SELECT stores.name, address.street, address.street2, address.city, address.state, address.zip
FROM stores
INNER JOIN address
ON address.id = stores.address_id
ORDER BY name ASC;