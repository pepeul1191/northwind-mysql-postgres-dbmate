-- migrate:up

CREATE TABLE `Employee_Dim` (
  `EmployeeKey` int NOT NULL AUTO_INCREMENT,
  `EmployeeName` varchar(50) NOT NULL,
  `EmployeeId` int NOT NULL,
  `HireDate` datetime DEFAULT NULL,
  PRIMARY KEY (`EmployeeKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- migrate:down

DROP TABLE `Employee_Dim`;