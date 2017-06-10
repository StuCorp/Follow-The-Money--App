DROP TABLE if exists transactions;
DROP TABLE if exists users;
DROP TABLE if exists tags;

CREATE TABLE users (
id SERIAL8 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE tags (
id SERIAL8 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  cost INT,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  tag_id INT REFERENCES tags(id) ON DELETE CASCADE
);