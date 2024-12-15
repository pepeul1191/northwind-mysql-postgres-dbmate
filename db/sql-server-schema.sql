USE Mart_OLAP_Northwind;

DROP TABLE sales_fact;
DROP TABLE customer_dim;
DROP TABLE employee_dim;
DROP TABLE product_dim;
DROP TABLE shipper_dim;
DROP TABLE time_dim;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer_Dim](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](24) NOT NULL,
	[Fax] [nvarchar](24) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NOT NULL,
	[ContactTitle] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[City] [nvarchar](15) NOT NULL,
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Employee_Dim]    Script Date: 30/10/2024 20:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee_Dim](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](30) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[HireDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Product_Dim]    Script Date: 30/10/2024 20:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Product_Dim](
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierName] [nvarchar](40) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ListUnitPrice] [money] NULL,
	[ProductKey] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sales_Fact]    Script Date: 30/10/2024 20:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales_Fact](
	[CustomerKey] [int] NOT NULL,
	[TimeKey] [int] NOT NULL,
	[EmployeeKey] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[ShipperKey] [int] NOT NULL,
	[LineItemDiscount] [real] NOT NULL,
	[LineItemQuantity] [smallint] NOT NULL,
	[LineItemFreight] [money] NOT NULL,
	[LineItemTotal] [money] NOT NULL,
	[RequeridDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Shipper_Dim]    Script Date: 30/10/2024 20:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Shipper_Dim](
	[ShipperKey] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](40) NOT NULL,
	[ShipperID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Time_Dim]    Script Date: 30/10/2024 20:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Time_Dim] (
  [TimeKey] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [YearMonth] NVARCHAR(65) NOT NULL,
  [DayOfWeek] NVARCHAR(65) NOT NULL,
  [WeekEnd] VARCHAR(8) NOT NULL,
  [Quarter] INT NOT NULL,
  [DayOfYear] INT NOT NULL,
  [WeekOfYear] INT NOT NULL,
  [Month] INT NOT NULL,
  [Year] INT NOT NULL,
  [TheDate] DATETIME NOT NULL,
  OrderId [int] 
) ON [PRIMARY];
GO
ALTER TABLE [Time_Dim]
ADD CONSTRAINT DF_WeekEnd DEFAULT 'Not' FOR [WeekEnd];
/****** Object:  Index [XPKCustomer_Dim]    Script Date: 30/10/2024 20:55:31 ******/
ALTER TABLE [Customer_Dim] ADD  CONSTRAINT [XPKCustomer_Dim] PRIMARY KEY NONCLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [XPKEmployee_Dim]    Script Date: 30/10/2024 20:55:31 ******/
ALTER TABLE [Employee_Dim] ADD  CONSTRAINT [XPKEmployee_Dim] PRIMARY KEY NONCLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [XPKProductKey]    Script Date: 30/10/2024 20:55:31 ******/
ALTER TABLE [Product_Dim] ADD  CONSTRAINT [XPKProductKey] PRIMARY KEY NONCLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [XPKSales_Fact]    Script Date: 30/10/2024 20:55:31 ******/
ALTER TABLE [Sales_Fact] ADD  CONSTRAINT [XPKSales_Fact] PRIMARY KEY NONCLUSTERED 
(
	[CustomerKey] ASC,
	[TimeKey] ASC,
	[ProductKey] ASC,
	[ShipperKey] ASC,
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [XPKShipper_Dim]    Script Date: 30/10/2024 20:55:31 ******/
ALTER TABLE [Shipper_Dim] ADD  CONSTRAINT [XPKShipper_Dim] PRIMARY KEY NONCLUSTERED 
(
	[ShipperKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [XPKTime_Dim]    Script Date: 30/10/2024 20:55:31 ******/
ALTER TABLE [Time_Dim] ADD  CONSTRAINT [XPKTime_Dim] PRIMARY KEY NONCLUSTERED 
(
	[TimeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Sales_Fact]  WITH CHECK ADD  CONSTRAINT [R_1] FOREIGN KEY([CustomerKey])
REFERENCES [Customer_Dim] ([CustomerKey])
GO
ALTER TABLE [Sales_Fact] CHECK CONSTRAINT [R_1]
GO
ALTER TABLE [Sales_Fact]  WITH CHECK ADD  CONSTRAINT [R_2] FOREIGN KEY([TimeKey])
REFERENCES [Time_Dim] ([TimeKey])
GO
ALTER TABLE [Sales_Fact] CHECK CONSTRAINT [R_2]
GO
ALTER TABLE [Sales_Fact]  WITH CHECK ADD  CONSTRAINT [R_3] FOREIGN KEY([EmployeeKey])
REFERENCES [Employee_Dim] ([EmployeeKey])
GO
ALTER TABLE [Sales_Fact] CHECK CONSTRAINT [R_3]
GO
ALTER TABLE [Sales_Fact]  WITH CHECK ADD  CONSTRAINT [R_4] FOREIGN KEY([ProductKey])
REFERENCES [Product_Dim] ([ProductKey])
GO
ALTER TABLE [Sales_Fact] CHECK CONSTRAINT [R_4]
GO
ALTER TABLE [Sales_Fact]  WITH CHECK ADD  CONSTRAINT [R_6] FOREIGN KEY([ShipperKey])
REFERENCES [Shipper_Dim] ([ShipperKey])
GO
ALTER TABLE [Sales_Fact] CHECK CONSTRAINT [R_6]
GO

