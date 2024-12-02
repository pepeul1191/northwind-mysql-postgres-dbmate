-- migrate:up

CREATE TABLE "Product_Dim" (
  "ProductName" varchar(50) NOT NULL,
  "SupplierName" varchar(50) NOT NULL,
  "CategoryName" varchar(15) NOT NULL,
  "ProductID" int NOT NULL,
  "ListUnitPrice" numeric(19,4) DEFAULT NULL,  -- Uso de 'numeric' para precisión decimal
  "ProductKey" serial NOT NULL,  -- 'serial' para autoincremento
  PRIMARY KEY ("ProductKey")
);

-- migrate:down

DROP TABLE "Product_Dim";