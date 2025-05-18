-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: food_order
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fooditem`
--

DROP TABLE IF EXISTS `fooditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fooditem` (
  `FooditemID` varchar(10) NOT NULL,
  `shopID` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `description` text,
  PRIMARY KEY (`FooditemID`),
  KEY `shopID` (`shopID`),
  CONSTRAINT `fooditem_ibfk_1` FOREIGN KEY (`shopID`) REFERENCES `shop` (`shopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fooditem`
--

LOCK TABLES `fooditem` WRITE;
/*!40000 ALTER TABLE `fooditem` DISABLE KEYS */;
INSERT INTO `fooditem` VALUES ('F001','SH001','Burger',450.00,'Juicy beef burger with cheese'),('F002','SH004','Pizza',1200.00,'Large chicken pizza with extra cheese'),('F003','SH003','Sandwich',350.00,'Healthy veggie sandwich'),('F004','SH003','Pasta',900.00,'Creamy Alfredo pasta'),('F005','SH005','Salad',600.00,'Fresh garden salad with dressing'),('F006','SH006','Rice & Curry',750.00,'Traditional Sri Lankan rice and curry'),('F007','SH007','French Fries',250.00,'Crispy golden fries'),('F008','SH008','Ice Cream',300.00,'Chocolate flavored ice cream'),('F009','SH002','Smoothie',450.00,'Strawberry banana smoothie'),('F010','SH003','Chicken Rolls',250.00,'Cheesy Chicken Rolls'),('F011','SH001','Lamp Rice',800.00,'Chicken Lump Rice'),('F012','SH006','Biriyani',600.00,'Special hydrabad dum biriyani'),('F013','SH007','Fried Rice',600.00,'Chicken Fried Rice'),('F014','SH003','Fish Pattie',90.00,'Crispy golden patty'),('F015','SH003','Chocolote Moose',300.00,'Chocolate flavored mouth watering moose'),('F016','SH002','Cheesecake',650.00,'Classic New York cheesecake');
/*!40000 ALTER TABLE `fooditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodorder`
--

DROP TABLE IF EXISTS `foodorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodorder` (
  `OrderID` varchar(10) NOT NULL,
  `ST_ID` varchar(10) NOT NULL,
  `Order_date` date NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `ST_ID` (`ST_ID`),
  CONSTRAINT `foodorder_ibfk_1` FOREIGN KEY (`ST_ID`) REFERENCES `student` (`ST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodorder`
--

LOCK TABLES `foodorder` WRITE;
/*!40000 ALTER TABLE `foodorder` DISABLE KEYS */;
INSERT INTO `foodorder` VALUES ('O001','21456','2025-05-10'),('O002','23456','2025-05-11'),('O003','24753','2025-05-12'),('O004','24758','2025-05-13'),('O005','24884','2025-05-14'),('O006','25678','2025-05-15'),('O007','28475','2025-05-16'),('O008','31245','2025-05-17'),('O009','29785','2025-05-18'),('O010','30124','2025-05-19');
/*!40000 ALTER TABLE `foodorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `OrderID` varchar(10) NOT NULL,
  `FooditemID` varchar(10) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`OrderID`,`FooditemID`),
  KEY `FooditemID` (`FooditemID`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `foodorder` (`OrderID`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`FooditemID`) REFERENCES `fooditem` (`FooditemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES ('O001','F001',2),('O002','F002',1),('O003','F003',3),('O004','F004',2),('O005','F005',1),('O006','F006',2),('O007','F007',3),('O008','F008',2),('O009','F009',1),('O010','F010',2);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` varchar(10) NOT NULL,
  `OrderID` varchar(10) NOT NULL,
  `payment_date` date NOT NULL,
  `method` varchar(20) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `foodorder` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('P001','O001','2025-05-10','Credit Card',900.00),('P002','O002','2025-05-11','Credit Card',1200.00),('P003','O003','2025-05-12','Debit Card',1050.00),('P004','O004','2025-05-13','Debit Card',1800.00),('P005','O005','2025-05-14','Credit Card',600.00),('P006','O006','2025-05-15','Credit Card',1500.00),('P007','O007','2025-05-16','Debit Card',750.00),('P008','O008','2025-05-17','Credit Card',600.00),('P009','O009','2025-05-18','Debit Card',450.00),('P010','O010','2025-05-19','Credit Card',500.00);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `shopID` varchar(10) NOT NULL,
  `shopName` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `telephone_No` varchar(15) NOT NULL,
  PRIMARY KEY (`shopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES ('SH001','P&S','B1','011-1234567'),('SH002','Barista','B1','011-9876543'),('SH003','Hostal Canteen','B5','011-5432167'),('SH004','Finagle','B3','011-6543219'),('SH005','Hela Bojun','B6','011-7890123'),('SH006','Tandoori','B6','011-8901234'),('SH007','Leyons','B6','011-5678901'),('SH008','Juice Bar','Trincomalee','011-4321987');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `ST_ID` varchar(10) NOT NULL,
  `ST_Name` varchar(100) NOT NULL,
  `ST_email` varchar(100) NOT NULL,
  `department` varchar(50) NOT NULL,
  PRIMARY KEY (`ST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('21456','Kasun Silva','kasun@gmail.com','Business Management'),('23456','Rashmi Rajapaksha','rashmi@egmail.com','MIS'),('24753','Nuwan Jayasinghe','nuwan@egmail.com','Accounting and Finance'),('24758','Amaya Fernando','amaya@gmail.com','Engineering'),('24884','Isuru Tennakoon','isuru@gmail.com','Interior Design'),('25678','Sanduni Karunaratne','sanduni@gmail.com','Law'),('28475','Tharushi Perera','tharushi@gmail.com','Computer Science'),('29785','Dilan Wickramasinghe','dilan@gmail.com','Bio Medical Science'),('30124','Harsha Ranasinghe','harsha@gmail.com','Nursing'),('31245','Chathura Herath','chathura@gmail.com','Biotechnology');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18  0:24:07
