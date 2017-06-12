DROP TABLE if exists transactions;
DROP TABLE if exists users;
DROP TABLE if exists tags;
DROP TABLE if exists providers;

CREATE TABLE users (
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
budget INT
);

CREATE TABLE tags (
id SERIAL8 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE providers (
id SERIAL8 PRIMARY KEY,
name VARCHAR(255)
);


CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  cost INT,
  buy_date DATE,
  luxury BOOLEAN,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  tag_id INT REFERENCES tags(id) ON DELETE CASCADE,
  provider_id INT REFERENCES providers(id) ON DELETE CASCADE
);