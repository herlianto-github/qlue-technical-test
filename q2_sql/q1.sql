SELECT psx.name, SUM (tx.total * itx.price::INTEGER) AS total_price 
FROM persons psx 
JOIN transactions tx ON psx.id = tx.person_id JOIN items itx ON tx.item_id = itx.id 
GROUP BY psx.name;