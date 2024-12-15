-- migrate:up

CREATE TABLE "Customer_Dim" (
  "CustomerKey" serial NOT NULL,
  "Phone" varchar(24) NOT NULL,
  "Fax" varchar(24),
  "Region" varchar(15),
  "PostalCode" varchar(10),
  "Country" varchar(15) NOT NULL,
  "ContactTitle" varchar(30) NOT NULL,
  "Address" varchar(60) NOT NULL,
  "City" varchar(15) NOT NULL,
  "CustomerID" char(5) NOT NULL,
  "CompanyName" varchar(40) NOT NULL,
  "ContactName" varchar(30) NOT NULL,
  PRIMARY KEY ("CustomerKey")
);

-- migrate:down

DROP TABLE "Customer_Dim";