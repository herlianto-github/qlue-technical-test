SELECT psx.name AS person_name, itx.name AS item_name, tx.total AS total_item, itx.price AS item_price, SUM (tx.total * itx.price::INTEGER) AS total_price, tx.date 
FROM persons psx 
JOIN transactions tx ON psx.id = tx.person_id 
JOIN items itx ON tx.item_id = itx.id 
WHERE date BETWEEN '2020-01-01 00:00:00' AND '2020-06-25 23:59:59' 
GROUP BY psx.name,itx.name,itx.price,tx.total,tx.date;