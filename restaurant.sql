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
table_number integer,
guests integer,
payment_status boolean
);

CREATE TABLE orders(
	id serial PRIMARY KEY,
	food_id integer,
	party_id integer,
	time TIMESTAMP
);
