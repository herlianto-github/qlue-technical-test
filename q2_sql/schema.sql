CREATE TABLE persons (
  id INTEGER PRIMARY KEY,
  name VARCHAR(200)
);

CREATE TABLE items(
    id INTEGER PRIMARY KEY,
    name VARCHAR(200),
    price VARCHAR(10)
);

CREATE TABLE transactions(
    id INTEGER PRIMARY KEY,
    person_id INTEGER,
    item_id INTEGER,
    total INTEGER,
    date timestamp,,
    FOREIGN KEY(person_id)
        REFERENCES persons(id),
    FOREIGN KEY(item_id)
        REFERENCES items(id)
);

