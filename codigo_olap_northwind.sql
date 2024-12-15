SELECT 
    TimeDim.TimeKey,
    CustomerDim.CustomerKey,
    ShipperDim.ShipperKey,
    ProductDim.ProductKey,
    EmployeeDim.EmployeeKey,
    Orders.RequiredDate,
    Orders.Freight * OrderDetails.Quantity / 
        (SELECT SUM(Quantity)
         FROM [Order Details] od
         WHERE od.OrderID = Orders.OrderID) AS LineItemFreight,
    OrderDetails.UnitPrice * OrderDetails.Quantity AS LineItemTotal,
    OrderDetails.Quantity AS LineItemQuantity,
    OrderDetails.Discount * OrderDetails.UnitPrice * OrderDetails.Quantity AS LineItemDiscount
FROM Orders
INNER JOIN [Order Details] AS OrderDetails
    ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN OPENQUERY(MySQL_LinkedServer, 'SELECT ProductKey, ProductID FROM Product_Dim') AS ProductDim
    ON CAST(OrderDetails.ProductID AS CHAR) = CAST(ProductDim.ProductID AS CHAR)
INNER JOIN OPENQUERY(MySQL_LinkedServer, 'SELECT CustomerKey, CustomerID FROM Customer_Dim') AS CustomerDim
    ON CAST(Orders.CustomerID AS CHAR) = CAST(CustomerDim.CustomerID AS CHAR)
INNER JOIN OPENQUERY(MySQL_LinkedServer, 'SELECT TimeKey, TheDate FROM Time_Dim') AS TimeDim
    ON CAST(Orders.ShippedDate AS DATE) = CAST(TimeDim.TheDate AS DATE)
INNER JOIN OPENQUERY(MySQL_LinkedServer, 'SELECT ShipperKey, ShipperID FROM Shipper_Dim') AS ShipperDim
    ON CAST(Orders.ShipVia AS CHAR) = CAST(ShipperDim.ShipperID AS CHAR)
INNER JOIN OPENQUERY(MySQL_LinkedServer, 'SELECT EmployeeKey, EmployeeID FROM Employee_Dim') AS EmployeeDim
    ON CAST(Orders.EmployeeID AS CHAR) = CAST(EmployeeDim.EmployeeID AS CHAR)
WHERE Orders.ShippedDate IS NOT NULL;