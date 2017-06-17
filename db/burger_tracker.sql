DROP TABLE IF EXISTS burger_deals;
DROP TABLE IF EXISTS deals;
DROP TABLE IF EXISTS burgers;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS days;

CREATE TABLE days 
(
  id SERIAL2 PRIMARY KEY,
  day VARCHAR(255)
);

CREATE TABLE restaurants
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE burgers
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  price FLOAT(2),
  restaurant_id INT4 REFERENCES restaurants(id)
);

CREATE TABLE deals
(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price_mod FLOAT(2),
  day_id INT2 REFERENCES days(id)
);

CREATE TABLE burger_deals
(
  id SERIAL4 PRIMARY KEY,
  deal_id INT4 REFERENCES deals(id),
  burger_id INT4 REFERENCES burgers(id)
);