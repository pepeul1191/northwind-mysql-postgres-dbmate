SET SQL_SAFE_UPDATES = 0;

USE mart_olap_norhtwind;
DELETE FROM Sales_Fact;
ALTER TABLE Sales_Fact AUTO_INCREMENT = 1;
DELETE FROM Time_Dim;
ALTER TABLE Time_Dim AUTO_INCREMENT = 1;
DELETE FROM Shipper_Dim;
ALTER TABLE Product_Dim AUTO_INCREMENT = 1;
DELETE FROM Product_Dim;
ALTER TABLE Product_Dim AUTO_INCREMENT = 1;
DELETE FROM Employee_Dim;
ALTER TABLE Employee_Dim AUTO_INCREMENT = 1;
DELETE FROM customer_dim;
ALTER TABLE Customer_Dim AUTO_INCREMENT = 1;

SELECT * FROM sales_fact;
SELECT * FROM time_dim;
SET SQL_SAFE_UPDATES = 1;
USE mart_olap_norhtwind;
SELECT 'Customer_Dim' AS table_name, COUNT(*) AS table_rows FROM Customer_Dim
UNION ALL
SELECT 'Product_Dim', COUNT(*) FROM Product_Dim
UNION ALL
SELECT 'Shipper_Dim', COUNT(*) FROM Shipper_Dim
UNION ALL
SELECT 'Employee_Dim', COUNT(*) FROM Employee_Dim
UNION ALL
SELECT 'Time_Dim', COUNT(*) FROM Time_Dim
UNION ALL
SELECT 'Sales_Fact', COUNT(*) FROM Sales_Fact;