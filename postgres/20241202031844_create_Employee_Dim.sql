-- migrate:up

CREATE TABLE "Employee_Dim" (
  "EmployeeKey" serial NOT NULL,
  "EmployeeName" varchar(50) NOT NULL,
  "EmployeeId" int NOT NULL,
  "HireDate" timestamp NULL,  -- `datetime` en MySQL se traduce a `timestamp` en PostgreSQL
  PRIMARY KEY ("EmployeeKey")
);

-- migrate:down

DROP TABLE "Employee_Dim";