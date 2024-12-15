/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Customer_Dim`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_Dim` (
  `CustomerKey` int NOT NULL AUTO_INCREMENT,
  `Phone` varchar(24) NOT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) NOT NULL,
  `ContactTitle` varchar(30) NOT NULL,
  `Address` varchar(60) NOT NULL,
  `City` varchar(15) NOT NULL,
  `CustomerID` char(5) NOT NULL,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) NOT NULL,
  PRIMARY KEY (`CustomerKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Employee_Dim`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee_Dim` (
  `EmployeeKey` int NOT NULL AUTO_INCREMENT,
  `EmployeeName` varchar(50) NOT NULL,
  `EmployeeId` int NOT NULL,
  `HireDate` datetime DEFAULT NULL,
  PRIMARY KEY (`EmployeeKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Product_Dim`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_Dim` (
  `ProductName` varchar(50) NOT NULL,
  `SupplierName` varchar(50) NOT NULL,
  `CategoryName` varchar(15) NOT NULL,
  `ProductID` int NOT NULL,
  `ListUnitPrice` decimal(19,4) DEFAULT NULL,
  `ProductKey` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ProductKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sales_Fact`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales_Fact` (
  `CustomerKey` int NOT NULL,
  `TimeKey` int NOT NULL,
  `EmployeeKey` int NOT NULL,
  `ProductKey` int NOT NULL,
  `ShipperKey` int NOT NULL,
  `LineItemDiscount` float NOT NULL,
  `LineItemQuantity` smallint NOT NULL,
  `LineItemFreight` decimal(19,4) NOT NULL,
  `LineItemTotal` decimal(19,4) NOT NULL,
  `RequeridDate` datetime NOT NULL,
  PRIMARY KEY (`CustomerKey`,`TimeKey`,`EmployeeKey`,`ProductKey`,`ShipperKey`),
  KEY `FK_Sales_Fact_Time` (`TimeKey`),
  KEY `FK_Sales_Fact_Employee` (`EmployeeKey`),
  KEY `FK_Sales_Fact_Product` (`ProductKey`),
  KEY `FK_Sales_Fact_Shipper` (`ShipperKey`),
  CONSTRAINT `FK_Sales_Fact_Customer` FOREIGN KEY (`CustomerKey`) REFERENCES `Customer_Dim` (`CustomerKey`),
  CONSTRAINT `FK_Sales_Fact_Employee` FOREIGN KEY (`EmployeeKey`) REFERENCES `Employee_Dim` (`EmployeeKey`),
  CONSTRAINT `FK_Sales_Fact_Product` FOREIGN KEY (`ProductKey`) REFERENCES `Product_Dim` (`ProductKey`),
  CONSTRAINT `FK_Sales_Fact_Shipper` FOREIGN KEY (`ShipperKey`) REFERENCES `Shipper_Dim` (`ShipperKey`),
  CONSTRAINT `FK_Sales_Fact_Time` FOREIGN KEY (`TimeKey`) REFERENCES `Time_Dim` (`TimeKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Shipper_Dim`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shipper_Dim` (
  `ShipperKey` int NOT NULL AUTO_INCREMENT,
  `ShipperName` varchar(50) NOT NULL,
  `ShipperID` int NOT NULL,
  PRIMARY KEY (`ShipperKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Time_Dim`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Time_Dim` (
  `TimeKey` int NOT NULL AUTO_INCREMENT,
  `YearMonth` char(25) NOT NULL,
  `DayOfWeek` char(10) NOT NULL,
  `WeekEnd` char(3) DEFAULT NULL,
  `Quarter` int NOT NULL,
  `DayOfYear` int NOT NULL,
  `WeekOfYear` int NOT NULL,
  `Month` int NOT NULL,
  `Year` int NOT NULL,
  `TheDate` datetime NOT NULL,
  OrderId int,
  PRIMARY KEY (`TimeKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(128) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'Mart_OLAP_Norhtwind'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed

--
-- Dbmate schema migrations
--

LOCK TABLES `schema_migrations` WRITE;
INSERT INTO `schema_migrations` (version) VALUES
  ('20241202025529'),
  ('20241202025847'),
  ('20241202025908'),
  ('20241202025919'),
  ('20241202025943'),
  ('20241202025951'),
  ('20241202030542');
UNLOCK TABLES;
