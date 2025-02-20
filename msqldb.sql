-- Create the database
CREATE DATABASE sneaker_store;
USE sneaker_store;

-- Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Order Items table
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Insert sample users
INSERT INTO users (name, email, password, phone, address) VALUES
('John Doe', 'john@example.com', 'hashed_password', '+1234567890', '123 Main St, City'),
('Jane Smith', 'jane@example.com', 'hashed_password', '+1987654321', '456 Elm St, City');

-- Insert sample products
INSERT INTO products (name, description, price, image_url) VALUES
('Air Force', 'New Season Air Force Sneakers', 10000.00, './img/air.png'),
('Air Jordan', 'New Season Air Jordan Sneakers', 13000.00, './img/jordan.png'),
('Blazer', 'New Season Blazer Sneakers', 10000.00, './img/blazer.png'),
('Crater', 'New Season Crater Sneakers', 11000.00, './img/crater.png'),
('Hippie', 'New Season Hippie Sneakers', 9000.00, './img/hippie.png');
