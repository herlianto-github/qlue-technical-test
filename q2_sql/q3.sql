SELECT * FROM (
    SELECT psx.name, SUM(tx.total) AS total_item, COUNT(DISTINCT(tx.item_id)) AS total_variety 
    FROM persons psx 
    JOIN transactions tx ON psx.id = tx.person_id 
    JOIN items itx ON tx.item_id = itx.id 
    GROUP BY psx.name ORDER BY total_variety DESC) AS q3 ;