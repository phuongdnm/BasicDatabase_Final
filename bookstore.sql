DROP DATABASE IF EXISTS Book_store;
CREATE DATABASE Book_store;
USE Book_store;

CREATE TABLE Authors(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    company_name VARCHAR(20)
);

CREATE TABLE Books(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    published_date DATE,
    ISBN INT NOT NULL,
    author_id INT NOT NULL UNIQUE,
    price FLOAT(6, 2),
    stock_quantity INT NOT NULL DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);

CREATE TABLE Customers(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    street VARCHAR(20),
    city VARCHAR(20),
    phone_number NUMERIC(9,0) NOT NULL,
    email VARCHAR(20) NOT NULL
);

CREATE TABLE Shippers(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    Phone_number NUMERIC(9,0)
);

CREATE TABLE Ratings(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    book_id INT NOT NULL UNIQUE,
    customer_id INT NOT NULL UNIQUE,
    rating FLOAT(2,1) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

CREATE TABLE Orders(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL UNIQUE,
    date DATETIME NOT NULL,
    shipper_id INT NOT NULL UNIQUE,
    status VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (shipper_id) REFERENCES Shippers(id)
);

CREATE TABLE Order_details(
    order_id INT NOT NULL UNIQUE,
    book_id INT NOT NULL UNIQUE,
    quantity INT,
    amount INT,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (book_id) REFERENCES Books(id)
);









