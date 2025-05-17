create database food_order;
show databases;
use food_order;
show tables;

CREATE TABLE Student (
    ST_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    ST_Name VARCHAR(100) NOT NULL,
    ST_email VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL
);

CREATE TABLE Shop (
    shopID VARCHAR(10) NOT NULL PRIMARY KEY,
    shopName VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    telephone_No VARCHAR(15) NOT NULL
);

CREATE TABLE FoodItem (
    FooditemID VARCHAR(10) NOT NULL PRIMARY KEY,
    shopID VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    description TEXT, -- nullable
    FOREIGN KEY (shopID) REFERENCES Shop(shopID)
);

CREATE TABLE FoodOrder (
    OrderID VARCHAR(10) NOT NULL PRIMARY KEY,
    ST_ID VARCHAR(10) NOT NULL,
    Order_date DATE NOT NULL,
    FOREIGN KEY (ST_ID) REFERENCES Student(ST_ID)
);

CREATE TABLE OrderDetails (
    OrderID VARCHAR(10) NOT NULL,
    FooditemID VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (OrderID, FooditemID),
    FOREIGN KEY (OrderID) REFERENCES FoodOrder(OrderID),
    FOREIGN KEY (FooditemID) REFERENCES FoodItem(FooditemID)
);

CREATE TABLE Payment (
    PaymentID VARCHAR(10) NOT NULL PRIMARY KEY,
    OrderID VARCHAR(10) NOT NULL,
    payment_date DATE NOT NULL,
    method VARCHAR(20) NOT NULL,
    amount DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES FoodOrder(OrderID)
);

show tables;
describe student;

