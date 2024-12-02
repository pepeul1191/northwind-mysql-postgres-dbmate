-- migrate:up

CREATE TABLE "Sales_Fact" (
  "CustomerKey" int NOT NULL,
  "TimeKey" int NOT NULL,
  "EmployeeKey" int NOT NULL,
  "ProductKey" int NOT NULL,
  "ShipperKey" int NOT NULL,
  "LineItemDiscount" real NOT NULL,  -- PostgreSQL usa 'real' como equivalente a 'float' de MySQL
  "LineItemQuantity" smallint NOT NULL,
  "LineItemFreight" numeric(19,4) NOT NULL,  -- 'numeric' se usa para precisión decimal
  "LineItemTotal" numeric(19,4) NOT NULL,
  "RequiredDate" timestamp NOT NULL,  -- 'timestamp' es el equivalente en PostgreSQL para 'datetime'
  PRIMARY KEY ("CustomerKey", "TimeKey", "EmployeeKey", "ProductKey", "ShipperKey")
);

-- migrate:down

DROP TABLE "Sales_Fact";