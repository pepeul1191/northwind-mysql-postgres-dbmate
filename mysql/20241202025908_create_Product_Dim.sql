-- migrate:up

CREATE TABLE `Product_Dim` (
  `ProductName` varchar(50) NOT NULL,
  `SupplierName` varchar(50) NOT NULL,
  `CategoryName` varchar(15) NOT NULL,
  `ProductID` int NOT NULL,
  `ListUnitPrice` decimal(19,4) DEFAULT NULL,  -- Aproximación común para el tipo 'money'
  `ProductKey` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ProductKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- migrate:down

DROP TABLE `Product_Dim`;