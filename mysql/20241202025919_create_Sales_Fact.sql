-- migrate:up

CREATE TABLE `Sales_Fact` (
  `CustomerKey` int NOT NULL,
  `TimeKey` int NOT NULL,
  `EmployeeKey` int NOT NULL,
  `ProductKey` int NOT NULL,
  `ShipperKey` int NOT NULL,
  `LineItemDiscount` float NOT NULL,  -- `real` en SQL Server se traduce a `float` en MySQL
  `LineItemQuantity` smallint NOT NULL,
  `LineItemFreight` decimal(19,4) NOT NULL,  -- Aproximación para `money`
  `LineItemTotal` decimal(19,4) NOT NULL,  -- Aproximación para `money`
  `RequeridDate` datetime NOT NULL,
  PRIMARY KEY (`CustomerKey`, `TimeKey`, `EmployeeKey`, `ProductKey`, `ShipperKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- migrate:down

DROP TABLE `Sales_Fact`;