-- migrate:up

CREATE TABLE "Shipper_Dim" (
  "ShipperKey" serial NOT NULL,  -- Autoincrementable en PostgreSQL
  "ShipperName" varchar(50) NOT NULL,
  "ShipperID" int NOT NULL,
  PRIMARY KEY ("ShipperKey")
);

-- migrate:down

DROP TABLE "Shipper_Dim";