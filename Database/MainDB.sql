#just the main structure... must be update
CREATE DATABASE vending_db;

CREATE TABLE users (
    id SERIAL PRIMARY KEY, ## at most one row can appear with that value 
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL, # uniqie as cannot appear twice 
    password VARCHAR(255) NOT NULL
);

CREATE TABLE vending_machines (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    last_update TIMESTAMP DEFAULT NOW()
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    vending_machine_id INTEGER REFERENCES vending_machines(id) ON DELETE CASCADE,
    quantity INTEGER NOT NULL DEFAULT 0
);
