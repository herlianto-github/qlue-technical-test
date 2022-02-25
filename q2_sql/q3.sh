dropdb qlue
createdb qlue
psql -d qlue -c "CREATE TABLE persons (id INTEGER PRIMARY KEY,name VARCHAR(200))"
psql -d qlue -c "INSERT INTO persons (id,name) VALUES (1,'person1'),(2,'person2'),(3,'person3'),(4,'person4'),(5,'person5')"
psql -d qlue -c "SELECT * FROM persons"
psql -d qlue -c "CREATE TABLE items (id INTEGER PRIMARY KEY,name VARCHAR(200),price VARCHAR(10))"
psql -d qlue -c "INSERT INTO items (id,name,price) VALUES (1,'Mango',1000),(2,'Apple',2000),(3,'Banana',3000),(4,'Watermelon',4000),(5,'Grape',5000)"
psql -d qlue -c "SELECT * FROM items"
psql -d qlue -c "CREATE TABLE transactions(id INTEGER PRIMARY KEY,person_id INTEGER,item_id INTEGER,total INTEGER,date timestamp,FOREIGN KEY(person_id) REFERENCES persons(id),FOREIGN KEY(item_id) REFERENCES items(id))"
psql -d qlue -c "INSERT INTO transactions (id,person_id,item_id,total,date) VALUES (1,1,1,1,'2020-01-01 00:00:00')
                                                                                  ,(6,2,1,1,'2020-02-01 00:00:00'),(7,2,2,2,'2020-02-01 00:00:00')
                                                                                  ,(11,3,1,1,'2020-05-01 00:00:00'),(12,3,2,2,'2020-05-01 00:00:00'),(13,3,3,3,'2020-05-01 00:00:00')
                                                                                  ,(16,4,1,1,'2020-06-01 00:00:00'),(17,4,2,2,'2020-06-01 00:00:00'),(18,4,3,3,'2020-06-01 00:00:00'),(19,4,4,4,'2020-06-01 00:00:00')
                                                                                  ,(21,5,1,1,'2020-08-01 00:00:00'),(22,5,2,2,'2020-08-01 00:00:00'),(23,5,3,3,'2020-08-01 00:00:00'),(24,5,4,4,'2020-08-01 00:00:00'),(25,5,5,5,'2020-08-01 00:00:00')"
psql -d qlue -c "SELECT * FROM transactions"                                                                                  
psql -d qlue -c "SELECT * FROM (SELECT psx.name, SUM(tx.total) AS total_item, COUNT(DISTINCT(tx.item_id)) AS total_variety FROM persons psx JOIN transactions tx ON psx.id = tx.person_id JOIN items itx ON tx.item_id = itx.id GROUP BY psx.name ORDER BY total_variety DESC) AS q3;"

