DROP DATABASE IF EXISTS Book_store;
CREATE DATABASE Book_store;
USE Book_store;

CREATE TABLE Authors(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    company_name VARCHAR(50)
);

CREATE TABLE Books(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    published_date DATE,
    ISBN INT,
    author_id INT NOT NULL,
    price FLOAT(6, 2),
    stock_quantity INT NOT NULL DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);

CREATE TABLE Customers(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    street VARCHAR(50),
    city VARCHAR(20),
    phone_number NUMERIC(9,0) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE Shippers(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    Phone_number NUMERIC(9,0)
);

CREATE TABLE Ratings(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    book_id INT NOT NULL,
    customer_id INT NOT NULL,
    rating FLOAT(3,1) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

CREATE TABLE Orders(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    customer_id INT NOT NULL,
    date DATE NOT NULL,
    shipper_id INT NOT NULL,
    quantity INT,
    status VARCHAR(10),
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (shipper_id) REFERENCES Shippers(id)
);









