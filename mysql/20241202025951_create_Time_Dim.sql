-- migrate:up

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
  `OrderId` int NOT NULL,
  `TheDate` datetime NOT NULL,
  PRIMARY KEY (`TimeKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- migrate:down

DROP TABLE `Time_Dim`;