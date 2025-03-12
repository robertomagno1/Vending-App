CREATE DATABASE vending_db;
\c vending_db;

-- Tabella utenti
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Tabella distributori automatici
CREATE TABLE vending_machines (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    status VARCHAR(50) CHECK (status IN ('active', 'inactive', 'maintenance')) DEFAULT 'active',
    last_update TIMESTAMP DEFAULT NOW()
);

-- Tabella prodotti
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    created_at TIMESTAMP DEFAULT NOW()
);

-- Tabella inventario dei distributori automatici
CREATE TABLE vending_machine_inventory (
    id SERIAL PRIMARY KEY,
    vending_machine_id INTEGER REFERENCES vending_machines(id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
    quantity INTEGER NOT NULL CHECK (quantity >= 0) DEFAULT 0,
    last_restocked TIMESTAMP DEFAULT NOW(),
    UNIQUE (vending_machine_id, product_id)
);

-- Tabella pagamenti
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    vending_machine_id INTEGER REFERENCES vending_machines(id) ON DELETE CASCADE,
    total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount >= 0),
    payment_method VARCHAR(50) CHECK (payment_method IN ('card', 'cash', 'mobile')),
    status VARCHAR(50) CHECK (status IN ('pending', 'completed', 'failed')) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT NOW()
);

-- Tabella ordini
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    vending_machine_id INTEGER REFERENCES vending_machines(id) ON DELETE CASCADE,
    payment_id INTEGER REFERENCES payments(id) ON DELETE SET NULL,
    total_price DECIMAL(10,2) NOT NULL CHECK (total_price >= 0),
    status VARCHAR(50) CHECK (status IN ('pending', 'completed', 'canceled')) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT NOW()
);

-- Tabella dettagli degli ordini
CREATE TABLE order_details (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0)
);