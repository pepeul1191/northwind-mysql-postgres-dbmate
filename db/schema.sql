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
-- Table structure for table `customer_dim`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_dim` (
  `CustomerKey` int NOT NULL AUTO_INCREMENT,
  `Phone` varchar(50) NOT NULL,
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
-- Table structure for table `employee_dim`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_dim` (
  `EmployeeKey` int NOT NULL AUTO_INCREMENT,
  `EmployeeName` varchar(50) NOT NULL,
  `EmployeeId` int NOT NULL,
  `HireDate` datetime DEFAULT NULL,
  PRIMARY KEY (`EmployeeKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_dim`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_dim` (
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
-- Table structure for table `sales_fact`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_fact` (
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
  PRIMARY KEY (`CustomerKey`,`TimeKey`,`EmployeeKey`,`ProductKey`,`ShipperKey`)
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
-- Table structure for table `shipper_dim`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipper_dim` (
  `ShipperKey` int NOT NULL AUTO_INCREMENT,
  `ShipperName` varchar(50) NOT NULL,
  `ShipperID` int NOT NULL,
  PRIMARY KEY (`ShipperKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_dim`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_dim` (
  `TimeKey` int NOT NULL AUTO_INCREMENT,
  `YearMonth` char(25) NOT NULL,
  `DayOfWeek` char(10) NOT NULL,
  `WeekEnd` char(3) DEFAULT NULL,
  `Quarter` int NOT NULL,
  `DayOfYear` int NOT NULL,
  `WeekOfYear` int NOT NULL,
  `Month` int NOT NULL,
  `Year` int NOT NULL,
  `TheDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TimeKey`)
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
  ('20241202025943'),
  ('20241202025951'),
  ('20241202030541'),
  ('20241202030542'),
  ('20241208011918'),
  ('20241208041434');
UNLOCK TABLES;
