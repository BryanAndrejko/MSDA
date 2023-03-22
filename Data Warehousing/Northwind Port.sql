
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path to db_dw;

SET default_tablespace = '';

SET default_with_oids = false;


---


CREATE TABLE NW_customer_DIM_test (
    customer_id_test bpchar NOT NULL,
    company_name  character varying(40) NOT NULL,
    contact_name  character varying(30),
    contact_title  character varying(30),
    address  character varying(60),
    city  character varying(15),
    region  character varying(15),
    postal_code  character varying(10),
    country  character varying(15),
    phone  character varying(24),
    fax  character varying(24)
);

ALTER TABLE ONLY NW_customer_DIM_test
    ADD CONSTRAINT pk_customers_test PRIMARY KEY (customer_id_test);


INSERT into db_dw.nw_customer_dim SELECT * FROM db_oltp.customers;

SELECT * FROM db_dw.nw_customer_dim


INSERT into db_dw.nw_customer_dim_test SELECT customer_id, company_name, contact_name, contact_title, address,     FROM db_oltp.customers;

SELECT * FROM db_dw.nw_customer_dim_test

CREATE TABLE NW_employee_DIM_test (
    employee_id_test bpchar NOT NULL,
    employee_last_name  character varying(24) NOT NULL,
    employee_first_name  character varying(24) NOT NULL,
    employee_title  character varying(24),
    employee_manager_name  character varying(24)
);

ALTER TABLE ONLY NW_employee_DIM_test
    ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id_test);

INSERT INTO [Northwind_DW].[dbo].Day_Dim( Date, DayName, WeekOfMonth, MonthName, Quarter, Year)
SELECT Date, DayName, WeekOfMonth, MonthName, Quarter, Year
FROM Northwind.dbo.day_dimension;


-- Working

INSERT into db_dw.nw_new_customer_dim SELECT customer_id, company_name, contact_name, customer_phone
FROM db_oltp.customers;

SELECT * FROM db_dw.nw_new_customer_dim

SELECT COUNT(*) FROM  db_dw.nw_new_customer_dim

SELECT * FROM db_dw.nw_new_customer_dim LIMIT 10

INSERT into db_dw.nw_employee_dim SELECT employee_id, last_name, first_name, title, reports_to
FROM db_oltp.employees;

SELECT * FROM db_dw.nw_employee_dim

SELECT COUNT(*) FROM  db_dw.nw_employee_dim

SELECT * FROM db_dw.nw_employee_dim LIMIT 10

INSERT into db_dw.nw_supplier_dim SELECT supplier_id, company_name, contact_name, phone
FROM db_oltp.suppliers;

SELECT * FROM db_dw.nw_supplier_dim

SELECT COUNT(*) FROM db_dw.nw_supplier_dim

SELECT * FROM db_dw.nw_supplier_dim LIMIT 10

CREATE TABLE NW_product_DIM (
    product_id bpchar NOT NULL,
    product_name character varying(24) NOT NULL,
    unit_price real NOT NULL,
    product_category character varying(24),
);

ALTER TABLE ONLY NW_product_DIM
    ADD CONSTRAINT pk_products PRIMARY KEY (product_id)

INSERT into db_dw.nw_product_dim SELECT product_id, product_name, unit_price, category_id
FROM db_oltp.products;

SELECT * FROM db_dw.nw_product_dim

SELECT COUNT(*) FROM db_dw.nw_product_dim

SELECT * FROM db_dw.nw_product_dim LIMIT 10

-- TEST works, brings in date and and order_as time_id

INSERT into db_dw.nw_time_dim_test2 SELECT order_id, order_date
FROM db_oltp.orders;

SELECT * FROM db_dw.nw_time_dim_test2;

SELECT COUNT(*) FROM db_dw.nw_time_dim_test2;
SELECT * FROM db_dw.nw_time_dim LIMIT 10



INSERT INTO [Northwind_DW].[dbo].Order_fact( OrderID, OrderDate, ProductID, CustomerID, EmployeeID, RequiredDate, ShippedDate, ShipVia, Date, Quantity, Discount, UnitPrice, Freight, UnitsInStock, UnitsInOrder, ReorderLevel) SELECT o.OrderID, o.OrderDate, p.ProductID, o.CustomerID, o.EmployeeID, o.RequiredDate, o.ShippedDate, o.ShipVia, d.Date, od.Quantity, od.Discount, od.UnitPrice, o.Freight,
p.UnitsInStock, p.UnitsOnOrder, p.ReorderLevel
FROM Northwind.dbo.Orders o JOIN Northwind.dbo.[Order Details] od ON od.OrderID = o.OrderID JOIN Northwind.dbo.Products p ON od.ProductID = p.ProductID JOIN Northwind.dbo.day_dimension d ON d.Date = o.OrderDate;


INSERT into db_dw.nw_time_dim_test2 SELECT order_id, order_date
FROM db_oltp.orders;

SELECT * FROM db_dw.nw_time_dim_test2;
SELECT COUNT(*) FROM db_dw.nw_time_dim_test2;
