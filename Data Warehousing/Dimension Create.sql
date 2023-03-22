
--
-- PostgreSQL database dump
--

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


CREATE TABLE NW_customer_DIM (
    customer_id bpchar NOT NULL,
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

ALTER TABLE ONLY NW_customer_DIM
    ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);

---


CREATE TABLE NW_new_customer_DIM (
    customer_id bpchar NOT NULL,
    customer_company_name  character varying(34) NOT NULL,
    customer_contact_name  character varying(24),
    customer_phone  character varying(24)
);

ALTER TABLE ONLY NW_new_customer_DIM
    ADD CONSTRAINT pk_customer PRIMARY KEY (customer_id);

---


CREATE TABLE NW_employee_DIM (
    employee_id bpchar NOT NULL,
    employee_last_name  character varying(24) NOT NULL,
    employee_first_name  character varying(24) NOT NULL,
    employee_title  character varying(24),
    employee_manager_name  character varying(24)
);

ALTER TABLE ONLY NW_employee_DIM
    ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);

---


CREATE TABLE NW_time_DIM (
    time_id date NOT NULL,
    day_of_week smallint,
    week_number smallint,
    month_number smallint,
    quarter smallint,
    year smallint,
    full_date date
);

ALTER TABLE ONLY NW_time_DIM
    ADD CONSTRAINT pk_time PRIMARY KEY (time_id);

---


CREATE TABLE NW_supplier_DIM (
    supplier_id bpchar NOT NULL,
    supplier_company_name character varying(24) NOT NULL,
    supplier_contact_name character varying(24) NOT NULL,
    supplier_phone character varying(24)
);

ALTER TABLE ONLY NW_supplier_DIM
    ADD CONSTRAINT pk_suppliers PRIMARY KEY (supplier_id);

---


CREATE TABLE NW_product_DIM (
    product_id bpchar NOT NULL,
    product_name character varying(24) NOT NULL,
    unit_price real NOT NULL,
    product_category character varying(24),
    SUPPLIER_ID bpchar
);

ALTER TABLE ONLY NW_product_DIM
    ADD CONSTRAINT pk_products PRIMARY KEY (product_id)
    ADD CONSTRAINT fk_products FOREIGN KEY (supplier_id) REFERENCES NW_supplier_DIM (supplier_id);


---


CREATE TABLE NW_order_FACT (
    order_id bpchar NOT NULL,
    product_id bpchar NOT NULL,
    employee_id bpchar NOT NULL,
    customer_id bpchar NOT NULL,
    supplier_id bpchar NOT NULL,
    time_id date NOT NULL,
    price real,
    quantity smallint
);

ALTER TABLE ONLY NW_order_FACT
    ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);

ALTER TABLE ONLY NW_order_FACT
    ADD CONSTRAINT fk_products FOREIGN KEY (product_id) REFERENCES NW_product_DIM (product_id);

ALTER TABLE ONLY NW_order_FACT
    ADD CONSTRAINT fk_employees FOREIGN KEY (employee_id) REFERENCES NW_employee_DIM (employee_id);

ALTER TABLE ONLY NW_order_FACT
    ADD CONSTRAINT fk_customers FOREIGN KEY (customer_id) REFERENCES NW_new_customer_DIM (customer_id);

ALTER TABLE ONLY NW_order_FACT
    ADD CONSTRAINT fk_suppliers FOREIGN KEY (supplier_id) REFERENCES NW_supplier_DIM (supplier_id);

ALTER TABLE ONLY NW_order_FACT
    ADD CONSTRAINT fk_time FOREIGN KEY (time_id) REFERENCES NW_time_DIM (time_id);

---

ALTER TABLE cities ADD CONSTRAINT countries_cities_fk
FOREIGN KEY (cou_id)
REFERENCES countries (cou_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE customers ADD CONSTRAINT cities_clients_fk
FOREIGN KEY (city_id)
REFERENCES cities (city_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
