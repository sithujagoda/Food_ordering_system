create database food_order;
use food_order;

CREATE TABLE Student (
    ST_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    ST_Name VARCHAR(100) NOT NULL,
    ST_email VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL
);

INSERT INTO Student (ST_ID, ST_Name, ST_email, department) VALUES
('21456','Kasun Silva','kasun@gmail.com','Business Management'),
('23456','Rashmi Rajapaksha','rashmi@egmail.com','MIS'),
('24753','Nuwan Jayasinghe','nuwan@egmail.com','Accounting and Finance'),
('24758','Amaya Fernando','amaya@gmail.com','Engineering'),
('24884','Isuru Tennakoon','isuru@gmail.com','Interior Design'),
('25678','Sanduni Karunaratne','sanduni@gmail.com','Law'),
('28475','Tharushi Perera','tharushi@gmail.com','Computer Science'),
('29785','Dilan Wickramasinghe','dilan@gmail.com','Bio Medical Science'),
('30124','Harsha Ranasinghe','harsha@gmail.com','Nursing'),
('31245','Chathura Herath','chathura@gmail.com','Biotechnology');


CREATE TABLE Shop (
    shopID VARCHAR(10) NOT NULL PRIMARY KEY,
    shopName VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    telephone_No VARCHAR(15) NOT NULL
);

INSERT INTO Shop (shopID, shopName, location, telephone_No) VALUES
('SH001','P&S','B1','011-1234567'),
('SH002','Barista','B1','011-9876543'),
('SH003','Hostal Canteen','B5','011-5432167'),
('SH004','Finagle','B3','011-6543219'),
('SH005','Hela Bojun','B6','011-7890123'),
('SH006','Tandoori','B6','011-8901234'),
('SH007','Leyons','B6','011-5678901'),
('SH008','Juice Bar','Trincomalee','011-4321987');


CREATE TABLE FoodItem (
    FooditemID VARCHAR(10) NOT NULL PRIMARY KEY,
    shopID VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    description TEXT, -- nullable
    FOREIGN KEY (shopID) REFERENCES Shop(shopID)
);

INSERT INTO FoodItem (FooditemID, shopID, name, price, description) VALUES
('F001','SH001','Burger',450.00,'Juicy beef burger with cheese'),
('F002','SH004','Pizza',1200.00,'Large chicken pizza with extra cheese'),
('F003','SH003','Sandwich',350.00,'Healthy veggie sandwich'),
('F004','SH003','Pasta',900.00,'Creamy Alfredo pasta'),
('F005','SH005','Salad',600.00,'Fresh garden salad with dressing'),
('F006','SH006','Rice & Curry',750.00,'Traditional Sri Lankan rice and curry'),
('F007','SH007','French Fries',250.00,'Crispy golden fries'),
('F008','SH008','Ice Cream',300.00,'Chocolate flavored ice cream'),
('F009','SH002','Smoothie',450.00,'Strawberry banana smoothie'),
('F010','SH003','Chicken Rolls',250.00,'Cheesy Chicken Rolls'),
('F011','SH001','Lamp Rice',800.00,'Chicken Lump Rice'),
('F012','SH006','Biriyani',600.00,'Special hydrabad dum biriyani'),
('F013','SH007','Fried Rice',600.00,'Chicken Fried Rice'),
('F014','SH003','Fish Pattie',90.00,'Crispy golden patty'),
('F015','SH003','Chocolote Moose',300.00,'Chocolate flavored mouth watering moose'),
('F016','SH002','Cheesecake',650.00,'Classic New York cheesecake');


CREATE TABLE FoodOrder (
    OrderID VARCHAR(10) NOT NULL PRIMARY KEY,
    ST_ID VARCHAR(10) NOT NULL,
    Order_date DATE NOT NULL,
    FOREIGN KEY (ST_ID) REFERENCES Student(ST_ID)
);

INSERT INTO FoodOrder (OrderID, ST_ID, Order_date) VALUES
('O001','21456','2025-05-10'),
('O002','23456','2025-05-11'),
('O003','24753','2025-05-12'),
('O004','24758','2025-05-13'),
('O005','24884','2025-05-14'),
('O006','25678','2025-05-15'),
('O007','28475','2025-05-16'),
('O008','31245','2025-05-17'),
('O009','29785','2025-05-18'),
('O010','30124','2025-05-19');


CREATE TABLE OrderDetails (
    OrderID VARCHAR(10) NOT NULL,
    FooditemID VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (OrderID, FooditemID),
    FOREIGN KEY (OrderID) REFERENCES FoodOrder(OrderID),
    FOREIGN KEY (FooditemID) REFERENCES FoodItem(FooditemID)
);

INSERT INTO OrderDetails (OrderID, FooditemID, quantity) VALUES
('O001','F001',2),
('O002','F002',1),
('O003','F003',3),
('O004','F004',2),
('O005','F005',1),
('O006','F006',2),
('O007','F007',3),
('O008','F008',2),
('O009','F009',1),
('O010','F010',2);


CREATE TABLE Payment (
    PaymentID VARCHAR(10) NOT NULL PRIMARY KEY,
    OrderID VARCHAR(10) NOT NULL,
    payment_date DATE NOT NULL,
    method VARCHAR(20) NOT NULL,
    amount DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES FoodOrder(OrderID)
);

INSERT INTO Payment (PaymentID, OrderID, payment_date, method, amount) VALUES
('P001','O001','2025-05-10','Credit Card',900.00),
('P002','O002','2025-05-11','Credit Card',1200.00),
('P003','O003','2025-05-12','Debit Card',1050.00),
('P004','O004','2025-05-13','Debit Card',1800.00),
('P005','O005','2025-05-14','Credit Card',600.00),
('P006','O006','2025-05-15','Credit Card',1500.00),
('P007','O007','2025-05-16','Debit Card',750.00),
('P008','O008','2025-05-17','Credit Card',600.00),
('P009','O009','2025-05-18','Debit Card',450.00),
('P010','O010','2025-05-19','Credit Card',500.00);








