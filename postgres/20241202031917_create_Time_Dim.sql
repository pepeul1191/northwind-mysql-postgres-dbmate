-- migrate:up

CREATE TABLE "Time_Dim" (
  "TimeKey" serial NOT NULL,  -- serial para autoincremento
  "YearMonth" char(25) NOT NULL,  -- char se usa para caracteres de longitud fija
  "DayOfWeek" char(10) NOT NULL,
  "WeekEnd" char(3),
  "Quarter" int NOT NULL,
  "DayOfYear" int NOT NULL,
  "WeekOfYear" int NOT NULL,
  "Month" int NOT NULL,
  "Year" int NOT NULL,
  "TheDate" timestamp NOT NULL,  -- timestamp para fechas y horas
  PRIMARY KEY ("TimeKey")
);

-- migrate:down

DROP TABLE "Time_Dim";