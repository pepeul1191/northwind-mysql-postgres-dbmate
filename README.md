# Migraciones DBMATE - MySQL y Postgres Northwind
---

### .env

Archivo <b>.env</b>

DB_MYSQL="mysql://root:root_password@127.0.0.1:3310/Mart_OLAP_Norhtwind"
DB_PG="postgres://myuser:mypassword@127.0.0.1:5433/Mart_OLAP_Norhtwind?sslmode=disable"

### Dockers

MySQL <b>docker-compose.yml</b>

```yml
version: '3.8'

services:
  db:
    image: mysql:8.0  # Puedes usar otra versión si lo prefieres
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root_password    # Cambia por una contraseña segura
      MYSQL_DATABASE: my_database             # Nombre de la base de datos inicial
      MYSQL_USER: my_user                      # Nombre de usuario
      MYSQL_PASSWORD: 123              # Contraseña del usuario
    ports:
      - "3310:3306"                            # Exponer el puerto para conexiones remotas
    volumes:
      - db_data:/var/lib/mysql                 # Persistencia de datos

volumes:
  db_data:
```

Truncar todas la tablas: 

```sql
SET SQL_SAFE_UPDATES = 0;

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

-- sql server

-- Vaciar la tabla Time_Dim y reiniciar el contador de identidad a 1

ALTER TABLE NombreDeLaTablaDestino
ALTER COLUMN WeekEnd NVARCHAR(50);

TRUNCATE TABLE Sales_Fact
DELETE FROM Sales_Fact
DELETE FROM Employee_Dim DBCC CHECKIDENT('Employee_Dim',reseed,0)
DELETE FROM Time_Dim DBCC CHECKIDENT('Time_Dim', reseed,0)
DELETE FROM Customer_Dim DBCC CHECKIDENT('Customer_Dim',reseed,0)  
DELETE FROM Shipper_Dim DBCC CHECKIDENT('Shipper_Dim', reseed,0)
DELETE FROM Product_Dim DBCC CHECKIDENT('Product_Dim', reseed,0)

```
```sql
CREATE LOGIN root
WITH PASSWORD = 'Root-123';

ALTER SERVER ROLE sysadmin ADD MEMBER root;
SELECT 
    spr.name AS RoleName, 
    sp.name AS MemberName 
FROM 
    sys.server_role_members srm
JOIN 
    sys.server_principals spr ON srm.role_principal_id = spr.principal_id
JOIN 
    sys.server_principals sp ON srm.member_principal_id = sp.principal_id
WHERE sp.name = 'root';
```

```sql
SELECT * FROM sys.servers;

EXEC sp_enum_oledb_providers;
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;

EXEC sp_dropserver 'MySQL_LinkedServer', 'droplogins';
SELECT @@VERSION;
EXEC sp_addlinkedserver 
    @server = 'MySQL_LinkedServer',
    @srvproduct = '',
    @provider = 'MSDASQL',
    @datasrc = 'OLAP MySQL Norwind 64 bits';

EXEC sp_addlinkedsrvlogin 
    @rmtsrvname = 'MySQL_LinkedServer',
    @useself = 'false',
    @locallogin = NULL,
    @rmtuser = 'root', -- Usuario de MySQL
    @rmtpassword = 'Root-123'; 

DBCC TRACEON(7300);

SELECT * 
FROM OPENQUERY(MySQL_LinkedServer, 'SELECT * FROM Customer_Dim LIMIT 10');

mysqldump -u root -p mart_olap_norhtwind > mart_olap_norhtwind_dump.sql
mysql -u root -p [nombre_base_datos] < mart_olap_norhtwind_dump.sql

SELECT 
    TABLE_NAME AS TableName,
    TABLE_ROWS AS RowCount
FROM 
    information_schema.TABLES
WHERE 
    TABLE_SCHEMA = 'mart_olap_norhtwind'
ORDER BY 
    TABLE_ROWS DESC;

USE Northwind;
SET IDENTITY_INSERT Orders ON;
-- Nueva orden de id 11081
INSERT INTO dbo.[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11081, N'VINET', 5, CAST(N'2024-11-30T00:00:00.000' AS DateTime), CAST(N'2024-11-30T00:00:00.000' AS DateTime), CAST(N'2024-11-30T00:00:00.000' AS DateTime), 3, 32.3800, N'Vins et alcools Chevalier', N'59 rue de l''Abbaye', N'Reims', NULL, N'51100', N'France');
-- Detalle de la orden de id 11081
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11081, 11, 14.0000, 12, 0);
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11081, 42, 9.8000, 10, 0);
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11081, 72, 34.8000, 5, 0);

-- antiguo

SELECT 
  Mart_OLAP_Northwind.dbo.Time_Dim.TimeKey,
  Mart_OLAP_Northwind.dbo.Customer_Dim.CustomerKey,
  Mart_OLAP_Northwind.dbo.Shipper_Dim.ShipperKey,
  Mart_OLAP_Northwind.dbo.Product_Dim.ProductKey,
  Mart_OLAP_Northwind.dbo.Employee_Dim.EmployeeKey,
  Orders.RequiredDate,
  Orders.Freight * [Order Details].Quantity /(SELECT SUM(Quantity)
FROM [Order Details] od
WHERE od.OrderID = Orders.OrderID) AS LineItemFreight,
  [Order Details].UnitPrice * [Order Details].Quantity AS LineItemTotal,
  [Order Details].Quantity AS LineItemQuantity,
  [Order Details].Discount * [Order Details].UnitPrice *[Order Details].Quantity AS LineItemDiscount
FROM Orders
INNER JOIN [Order Details] ON Orders.OrderID =[Order Details].OrderID
INNER JOIN Mart_OLAP_Northwind.dbo.Product_Dim ON [Order Details].ProductID =Mart_OLAP_Northwind.dbo.Product_Dim.ProductID 
INNER JOIN Mart_OLAP_Northwind.dbo.Customer_Dim ON Orders.CustomerID COLLATE DATABASE_DEFAULT = Mart_OLAP_Northwind.dbo.Customer_Dim.CustomerID COLLATE DATABASE_DEFAULT 
INNER JOIN Mart_OLAP_Northwind.dbo.Time_Dim ON Orders.ShippedDate =Mart_OLAP_Northwind.dbo.Time_Dim.TheDate
INNER JOIN Mart_OLAP_Northwind.dbo.Shipper_Dim ON Orders.ShipVia = Mart_OLAP_Northwind.dbo.Shipper_Dim.ShipperID 
INNER JOIN Mart_OLAP_Northwind.dbo.Employee_Dim ON Orders.EmployeeID =Mart_OLAP_Northwind.dbo.Employee_Dim.EmployeeID
WHERE (Orders.ShippedDate IS NOT NULL)

-- nuevo
```

Para SQL Server
Puedes usar la vista del sistema sys.objects junto con una consulta dinámica para contar los registros de cada tabla.

```sql
SELECT 
    t.NAME AS TableName,
    i.rows AS RowCounts
FROM 
    sys.tables AS t
INNER JOIN      
    sys.sysindexes AS i ON t.object_id = i.id
WHERE 
    i.indid < 2 -- Filtra el índice primario (0) o clúster (1)
ORDER BY 
    i.rows DESC;
```

Explicación:
sys.tables: Contiene información sobre todas las tablas del esquema.
sys.sysindexes: Proporciona información sobre índices y estadísticas de filas.
La consulta devuelve el nombre de la tabla y la cantidad de filas (RowCounts).
Para MySQL
Puedes usar la tabla information_schema.tables para consultar el nombre de las tablas y el recuento aproximado de filas.

```sql
SELECT 
    table_name,
    table_rows
FROM 
    information_schema.tables
WHERE 
    table_schema = 'mart_olap_northwind';
```

Explicación:
information_schema.tables: Contiene información sobre todas las tablas en una base de datos.
TABLE_SCHEMA: Especifica el nombre de tu base de datos.
TABLE_ROWS: Proporciona un recuento aproximado de las filas (puede no ser exacto para tablas InnoDB).

Postgres <b>docker-compose.yml</b>

```yml
version: '3.8'
services:
  postgres:
    image: postgres:13  # Puedes elegir la versión que necesites
    restart: always
    environment:
      POSTGRES_DB: mydatabase       # Nombre de la base de datos
      POSTGRES_USER: myuser         # Usuario de la base de datos
      POSTGRES_PASSWORD: mypassword # Contraseña del usuario
    volumes:
      - postgres_data:/var/lib/postgresql/data  # Persistencia de datos
    ports:
      - "5433:5432"  # Puertos de mapeo (host:container)

volumes:
  postgres_data:
    driver: local
```

### Migraciones

Migraciones con DBMATE - Mart_OLAP_Norhtwind - MySQL:

    $ npm run mysql:new <<nombre_de_migracion>>
    $ npm run mysql:up
    $ npm run mysql:rollback

Migraciones con DBMATE - Mart_OLAP_Norhtwind - Postgres:

    $ npm run pg:new <<nombre_de_migracion>>
    $ npm run pg:up
    $ npm run pg:rollback

---

Fuentes:

+ https://github.com/pepeul1191/flask-boilerplate-v2
+ https://www.pylint.org/#install
+ https://stackabuse.com/reading-and-writing-yaml-to-a-file-in-python/
+ https://github.com/pepeul1191/python-bottle-boilerplate


---

Fuentes:

+ https://github.com/codzsword/bootstrap-admin-dashboard/tree/main
+ https://www.youtube.com/watch?v=4VN8ZdDse9M