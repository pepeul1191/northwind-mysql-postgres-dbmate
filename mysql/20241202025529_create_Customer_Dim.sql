-- migrate:up

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- migrate:down

DROP TABLE CREATE TABLE `Customer_Dim`;