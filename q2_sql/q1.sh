dropdb qlue
createdb qlue
psql -d qlue -c "CREATE TABLE persons (id INTEGER PRIMARY KEY,name VARCHAR(200))"
psql -d qlue -c "INSERT INTO persons (id,name) VALUES (1,'person1'),(2,'person2'),(3,'person3'),(4,'person4'),(5,'person5')"
psql -d qlue -c "SELECT * FROM persons"
psql -d qlue -c "CREATE TABLE items (id INTEGER PRIMARY KEY,name VARCHAR(200),price VARCHAR(10))"
psql -d qlue -c "INSERT INTO items (id,name,price) VALUES (1,'Mango',1000),(2,'Apple',2000),(3,'Banana',3000),(4,'Watermelon',4000),(5,'Grape',5000)"
psql -d qlue -c "SELECT * FROM items"
psql -d qlue -c "CREATE TABLE transactions(id INTEGER PRIMARY KEY,person_id INTEGER,item_id INTEGER,total INTEGER,date timestamp,FOREIGN KEY(person_id) REFERENCES persons(id),FOREIGN KEY(item_id) REFERENCES items(id))"
psql -d qlue -c "INSERT INTO transactions (id,person_id,item_id,total,date) VALUES (1,1,1,1,current_timestamp),(2,1,2,2,current_timestamp),(3,1,3,3,current_timestamp),(4,1,4,4,current_timestamp),(5,1,5,5,current_timestamp)
                                                                                  ,(6,2,1,1,current_timestamp),(7,2,2,2,current_timestamp),(8,2,3,3,current_timestamp),(9,2,4,4,current_timestamp),(10,2,5,5,current_timestamp)
                                                                                  ,(11,3,1,1,current_timestamp),(12,3,2,2,current_timestamp),(13,3,3,3,current_timestamp),(14,3,4,4,current_timestamp),(15,3,5,5,current_timestamp)
                                                                                  ,(16,4,1,1,current_timestamp),(17,4,2,2,current_timestamp),(18,4,3,3,current_timestamp),(19,4,4,4,current_timestamp),(20,4,5,5,current_timestamp)
                                                                                  ,(21,5,1,1,current_timestamp),(22,5,2,2,current_timestamp),(23,5,3,3,current_timestamp),(24,5,4,4,current_timestamp),(25,5,5,5,current_timestamp)"
psql -d qlue -c "SELECT * FROM transactions"                                                                                  
psql -d qlue -c "SELECT psx.name, SUM (tx.total * itx.price::INTEGER) AS total_price FROM persons psx JOIN transactions tx ON psx.id = tx.person_id JOIN items itx ON tx.item_id = itx.id GROUP BY psx.name;"