SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Customer_Dim; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Customer_Dim" (
    "CustomerKey" integer NOT NULL,
    "Phone" character varying(24) NOT NULL,
    "Fax" character varying(24),
    "Region" character varying(15),
    "PostalCode" character varying(10),
    "Country" character varying(15) NOT NULL,
    "ContactTitle" character varying(30) NOT NULL,
    "Address" character varying(60) NOT NULL,
    "City" character varying(15) NOT NULL,
    "CustomerID" character(5) NOT NULL,
    "CompanyName" character varying(40) NOT NULL,
    "ContactName" character varying(30) NOT NULL
);


--
-- Name: Customer_Dim_CustomerKey_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Customer_Dim_CustomerKey_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Customer_Dim_CustomerKey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Customer_Dim_CustomerKey_seq" OWNED BY public."Customer_Dim"."CustomerKey";


--
-- Name: Employee_Dim; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Employee_Dim" (
    "EmployeeKey" integer NOT NULL,
    "EmployeeName" character varying(50) NOT NULL,
    "EmployeeId" integer NOT NULL,
    "HireDate" timestamp without time zone
);


--
-- Name: Employee_Dim_EmployeeKey_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Employee_Dim_EmployeeKey_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Employee_Dim_EmployeeKey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Employee_Dim_EmployeeKey_seq" OWNED BY public."Employee_Dim"."EmployeeKey";


--
-- Name: Product_Dim; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Product_Dim" (
    "ProductName" character varying(50) NOT NULL,
    "SupplierName" character varying(50) NOT NULL,
    "CategoryName" character varying(15) NOT NULL,
    "ProductID" integer NOT NULL,
    "ListUnitPrice" numeric(19,4) DEFAULT NULL::numeric,
    "ProductKey" integer NOT NULL
);


--
-- Name: Product_Dim_ProductKey_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Product_Dim_ProductKey_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Product_Dim_ProductKey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Product_Dim_ProductKey_seq" OWNED BY public."Product_Dim"."ProductKey";


--
-- Name: Sales_Fact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Sales_Fact" (
    "CustomerKey" integer NOT NULL,
    "TimeKey" integer NOT NULL,
    "EmployeeKey" integer NOT NULL,
    "ProductKey" integer NOT NULL,
    "ShipperKey" integer NOT NULL,
    "LineItemDiscount" real NOT NULL,
    "LineItemQuantity" smallint NOT NULL,
    "LineItemFreight" numeric(19,4) NOT NULL,
    "LineItemTotal" numeric(19,4) NOT NULL,
    "RequiredDate" timestamp without time zone NOT NULL
);


--
-- Name: Shipper_Dim; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Shipper_Dim" (
    "ShipperKey" integer NOT NULL,
    "ShipperName" character varying(50) NOT NULL,
    "ShipperID" integer NOT NULL
);


--
-- Name: Shipper_Dim_ShipperKey_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Shipper_Dim_ShipperKey_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Shipper_Dim_ShipperKey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Shipper_Dim_ShipperKey_seq" OWNED BY public."Shipper_Dim"."ShipperKey";


--
-- Name: Time_Dim; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Time_Dim" (
    "TimeKey" integer NOT NULL,
    "YearMonth" character(25) NOT NULL,
    "DayOfWeek" character(10) NOT NULL,
    "WeekEnd" character(3),
    "Quarter" integer NOT NULL,
    "DayOfYear" integer NOT NULL,
    "WeekOfYear" integer NOT NULL,
    "Month" integer NOT NULL,
    "Year" integer NOT NULL,
    "TheDate" timestamp without time zone NOT NULL
);


--
-- Name: Time_Dim_TimeKey_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Time_Dim_TimeKey_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Time_Dim_TimeKey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Time_Dim_TimeKey_seq" OWNED BY public."Time_Dim"."TimeKey";


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying(128) NOT NULL
);


--
-- Name: Customer_Dim CustomerKey; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Customer_Dim" ALTER COLUMN "CustomerKey" SET DEFAULT nextval('public."Customer_Dim_CustomerKey_seq"'::regclass);


--
-- Name: Employee_Dim EmployeeKey; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Employee_Dim" ALTER COLUMN "EmployeeKey" SET DEFAULT nextval('public."Employee_Dim_EmployeeKey_seq"'::regclass);


--
-- Name: Product_Dim ProductKey; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product_Dim" ALTER COLUMN "ProductKey" SET DEFAULT nextval('public."Product_Dim_ProductKey_seq"'::regclass);


--
-- Name: Shipper_Dim ShipperKey; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shipper_Dim" ALTER COLUMN "ShipperKey" SET DEFAULT nextval('public."Shipper_Dim_ShipperKey_seq"'::regclass);


--
-- Name: Time_Dim TimeKey; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Time_Dim" ALTER COLUMN "TimeKey" SET DEFAULT nextval('public."Time_Dim_TimeKey_seq"'::regclass);


--
-- Name: Customer_Dim Customer_Dim_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Customer_Dim"
    ADD CONSTRAINT "Customer_Dim_pkey" PRIMARY KEY ("CustomerKey");


--
-- Name: Employee_Dim Employee_Dim_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Employee_Dim"
    ADD CONSTRAINT "Employee_Dim_pkey" PRIMARY KEY ("EmployeeKey");


--
-- Name: Product_Dim Product_Dim_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product_Dim"
    ADD CONSTRAINT "Product_Dim_pkey" PRIMARY KEY ("ProductKey");


--
-- Name: Sales_Fact Sales_Fact_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sales_Fact"
    ADD CONSTRAINT "Sales_Fact_pkey" PRIMARY KEY ("CustomerKey", "TimeKey", "EmployeeKey", "ProductKey", "ShipperKey");


--
-- Name: Shipper_Dim Shipper_Dim_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shipper_Dim"
    ADD CONSTRAINT "Shipper_Dim_pkey" PRIMARY KEY ("ShipperKey");


--
-- Name: Time_Dim Time_Dim_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Time_Dim"
    ADD CONSTRAINT "Time_Dim_pkey" PRIMARY KEY ("TimeKey");


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: Sales_Fact FK_Sales_Fact_Customer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sales_Fact"
    ADD CONSTRAINT "FK_Sales_Fact_Customer" FOREIGN KEY ("CustomerKey") REFERENCES public."Customer_Dim"("CustomerKey");


--
-- Name: Sales_Fact FK_Sales_Fact_Employee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sales_Fact"
    ADD CONSTRAINT "FK_Sales_Fact_Employee" FOREIGN KEY ("EmployeeKey") REFERENCES public."Employee_Dim"("EmployeeKey");


--
-- Name: Sales_Fact FK_Sales_Fact_Product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sales_Fact"
    ADD CONSTRAINT "FK_Sales_Fact_Product" FOREIGN KEY ("ProductKey") REFERENCES public."Product_Dim"("ProductKey");


--
-- Name: Sales_Fact FK_Sales_Fact_Shipper; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sales_Fact"
    ADD CONSTRAINT "FK_Sales_Fact_Shipper" FOREIGN KEY ("ShipperKey") REFERENCES public."Shipper_Dim"("ShipperKey");


--
-- Name: Sales_Fact FK_Sales_Fact_Time; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sales_Fact"
    ADD CONSTRAINT "FK_Sales_Fact_Time" FOREIGN KEY ("TimeKey") REFERENCES public."Time_Dim"("TimeKey");


--
-- PostgreSQL database dump complete
--


--
-- Dbmate schema migrations
--

INSERT INTO public.schema_migrations (version) VALUES
    ('20241202031812'),
    ('20241202031844'),
    ('20241202031852'),
    ('20241202031901'),
    ('20241202031910'),
    ('20241202031917'),
    ('20241202031931');
