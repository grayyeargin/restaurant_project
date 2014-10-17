DROP DATABASE IF EXISTS restaurant;

CREATE DATABASE restaurant;

\c restaurant

CREATE TABLE foods(
id serial PRIMARY KEY,
name varchar(100),
course varchar(100),
price integer,
spicy boolean
);

CREATE TABLE parties(
id serial PRIMARY KEY,
last_name varchar(55),
table_number integer,
guests integer,
payment_status boolean,
checkout_time TIMESTAMP
);

CREATE TABLE orders(
	id serial PRIMARY KEY,
	food_id integer,
	party_id integer,
	cook_status boolean
);
