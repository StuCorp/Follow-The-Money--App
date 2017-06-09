DROP TABLE transactions

CREATE TABLE users (
id = SERIAL8 PRIMARY KEY,
name = VARCHAR(255)
);

CREATE TABLE tags (
id = SERIAL8 PRIMARY KEY,
name = VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  cost INT,
  user_id INT REFERENCES users(id),
  tag_id INT REFERENCES tags(id)
);