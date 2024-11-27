-- Creación de la tabla Users
CREATE TABLE Users (
    id INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    password VARCHAR(255),
    email VARCHAR(100)
);

-- Inserción de registros en la tabla Users
INSERT INTO Users (id, firstname, lastname, password, email) VALUES
(1, 'John', 'Doe', 'password123', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'securepass', 'jane.smith@example.com'),
(3, 'Alice', 'Johnson', 'alicepass', 'alice.johnson@example.com');

-- Creación de la tabla Addresses
CREATE TABLE Addresses (
    id INT PRIMARY KEY,
    user_id INT,
    country VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50),
    address1 VARCHAR(100),
    address2 VARCHAR(100),
    zip VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Inserción de registros en la tabla Addresses
INSERT INTO Addresses (id, user_id, country, state, city, address1, address2, zip) VALUES
(1, 1, 'USA', 'California', 'Los Angeles', '123 Main St', 'Apt 101', '90001'),
(2, 2, 'USA', 'New York', 'New York', '456 Park Ave', 'Suite 5A', '10001'),
(3, 3, 'Canada', 'Ontario', 'Toronto', '789 Queen St', 'Unit 202', 'M5H 2N2');

-- Creación de la tabla Payment Methods
CREATE TABLE Payment_Methods (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Inserción de registros en la tabla Payment Methods
INSERT INTO Payment_Methods (id, name) VALUES
(1, 'Credit Card'),
(2, 'PayPal'),
(3, 'Bank Transfer');

-- Creación de la tabla Orders
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    user_id INT,
    timestamp TIMESTAMP,
    payment_method_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (payment_method_id) REFERENCES Payment_Methods(id)
);

-- Inserción de registros en la tabla Orders
INSERT INTO Orders (id, user_id, timestamp, payment_method_id) VALUES
(1, 1, '2024-11-10 12:34:56', 1),
(2, 2, '2024-11-09 15:21:43', 2),
(3, 3, '2024-11-08 09:12:11', 3);

-- Creación de la tabla Categories
CREATE TABLE Categories (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Inserción de registros en la tabla Categories
INSERT INTO Categories (id, name) VALUES
(1, 'Electronics'),
(2, 'Mobile Devices'),
(3, 'Audio Equipment');

-- Creación de la tabla Products con la relación a Categories
CREATE TABLE Products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

-- Inserción de registros en la tabla Products
INSERT INTO Products (id, name, description, price, stock, category_id) VALUES
(1, 'Laptop', 'High-end gaming laptop', 1200.00, 15, 1),
(2, 'Smartphone', 'Latest model smartphone', 800.00, 30, 2),
(3, 'Headphones', 'Noise-cancelling headphones', 150.00, 50, 3);

-- Creación de la tabla Product Details
CREATE TABLE Product_Details (
    order_id INT,
    product_id INT,
    count INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- Inserción de registros en la tabla Product Details
INSERT INTO Product_Details (order_id, product_id, count) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3);

