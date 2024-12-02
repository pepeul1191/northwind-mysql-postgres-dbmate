-- migrate:up

CREATE TABLE `Shipper_Dim` (
  `ShipperKey` int NOT NULL AUTO_INCREMENT,
  `ShipperName` varchar(50) NOT NULL,
  `ShipperID` int NOT NULL,
  PRIMARY KEY (`ShipperKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- migrate:down

DROP TABLE `Shipper_Dim`;
