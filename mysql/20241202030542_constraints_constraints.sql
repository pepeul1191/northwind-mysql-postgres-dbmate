-- migrate:up

ALTER TABLE `Sales_Fact`
ADD CONSTRAINT `FK_Sales_Fact_Customer` FOREIGN KEY (`CustomerKey`) REFERENCES `Customer_Dim` (`CustomerKey`);

ALTER TABLE `Sales_Fact`
ADD CONSTRAINT `FK_Sales_Fact_Time` FOREIGN KEY (`TimeKey`) REFERENCES `Time_Dim` (`TimeKey`);

ALTER TABLE `Sales_Fact`
ADD CONSTRAINT `FK_Sales_Fact_Employee` FOREIGN KEY (`EmployeeKey`) REFERENCES `Employee_Dim` (`EmployeeKey`);

ALTER TABLE `Sales_Fact`
ADD CONSTRAINT `FK_Sales_Fact_Product` FOREIGN KEY (`ProductKey`) REFERENCES `Product_Dim` (`ProductKey`);

ALTER TABLE `Sales_Fact`
ADD CONSTRAINT `FK_Sales_Fact_Shipper` FOREIGN KEY (`ShipperKey`) REFERENCES `Shipper_Dim` (`ShipperKey`);

-- migrate:down

ALTER TABLE `Sales_Fact`
DROP FOREIGN KEY `FK_Sales_Fact_Customer`;

ALTER TABLE `Sales_Fact`
DROP FOREIGN KEY `FK_Sales_Fact_Time`;

ALTER TABLE `Sales_Fact`
DROP FOREIGN KEY `FK_Sales_Fact_Employee`;

ALTER TABLE `Sales_Fact`
DROP FOREIGN KEY `FK_Sales_Fact_Product`;

ALTER TABLE `Sales_Fact`
DROP FOREIGN KEY `FK_Sales_Fact_Shipper`;
