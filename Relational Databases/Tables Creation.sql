-- Create Tables in CTA Module 2
CREATE TABLE Customer (
    CustNo char(8) NOT NULL,
    CustFirstName char(15) NOT NULL,
    CustLastName char(20) NOT NULL,
    CustCity char(20),
    CustState char(2),
    CustZip char(10),
    CustBal numeric(6,2),
    PRIMARY KEY (CustNo)
);

CREATE TABLE Employee (
    EmpNo char(8) NOT NULL,
    EmpFirstName char(15) NOT NULL,
    EmpLastName char(20) NOT NULL,
    EmpPhone char(20),
    EmpEmail char(35) NOT NULL,
    PRIMARY KEY (EmpNo)
);

CREATE TABLE OrderTbl (
    OrdNo char(8) NOT NULL,
    OrdDate date NOT NULL,
    CustNo char(8),
    EmpNo char(8),
    PRIMARY KEY (OrdNo)
);

-- Offical Instert of Table Data
INSERT INTO OrderTbl (OrdNo, OrdDate, CustNo, EmpNo) VALUES
    ('O1116324','01/23/2017','C0954327','E8544399'),
    ('O2334661','01/14/2017','C0954327','E1329594'),
    ('O3331222','01/13/2017','C1010398',NULL),
    ('O2233457','01/12/2017','C2388597','E9884325'),
    ('O4714645','01/11/2017','C2388597','E1329594'),
    ('O5511365','01/22/2017','C3340959','E9884325'),
    ('O7989497','01/16/2017','C3499503','E9345771'),
    ('O1656777','02/11/2017','C8543321',NULL),
    ('O7959898','02/19/2017','C8543321','E8544399');

  -- Offical Instert of Table Data
INSERT INTO Employee (EmpNo, EmpFirstName, EmpLastName, EmpPhone, EmpEmail) VALUES
    ('E1329594','Landi','Santos','(303) 789-1234', 'LSantos@bigco.com'),
    ('E8544399','Joe','Jenkins','(303) 9875-1234', 'JJenkins@bigco.com'),
    ('E8843211','Amy','Tang','(303) 556-4321', 'ATang@bigco.com'),
    ('E9345771','Colin','White','(303) 221-4453', 'CWhite@bigco.com'),
    ('E9884325','Thomas','Johnson','(303) 556-9987', 'TJohnson@bigco.com'),
    ('E9954302','Maiy','Hill','(303) 556-9871', 'MHill@bigco.com');

-- Offical Instert of Customer Data
INSERT INTO Customer (CustNo, CustFirstName, CustLastName, CustCity, CustState, CustZip, CustBal) VALUES
    ('C0954327','Sheri','Gordon','Littleton', 'CO', '80129-5543', '230.00'),
    ('C1010398','Jim','Glussman','Denver', 'CO', '80111-0033', '200.00'),
    ('C2388597','Beth','Taylor','Seattle', 'WA', '98103-1121', '500.00'),
    ('C3340959','Betty','Wise','Seattle', 'WA', '98178·3311', '200.00'),
    ('C3499503','Bob','Mann','Monroe', 'WA', '98013-1095', '0.00'),
    ('C8543321','Ron','Thompson','Renton', 'WA', '98666-1289', '85.00');

-- PRACTICE Notes below, stolen from last week CTA
-- PRACTICE This insert is tested and works on tests
 INSERT INTO OrderTbl (OrdNo, OrdDate, CustNo, EmpNo) VALUES
   ('OrdNo 1','2004-03-01','Cust 1',124578),
   ('OrdNo 2','2005-03-01','Cust 2',587985),
   ('OrdNo 3','2006-03-01','Cust 3',887744),
   ('OrdNo 4','2008-03-01','Cust 4',1155998);

INSERT INTO payment_methods (pay_code,pay_desc) VALUES
 ('AMEX','American Express'),
 ('CASH','Cash'),
 ('CHEC','Check'),
 ('MAST','Mastercard'),
 ('OTHE','Others'),
 ('VISA','Visa');

NSERT INTO products (pro_code,man_code,pro_name,pro_description,pro_type,pro_theme,pro_pieces,pro_packaging,pro_shape,pro_style,pro_buy_price,pro_sel_price,pro_stock,pro_stock_min,pro_stock_max) VALUES
 ('002SAG','RAV','Stow and Go!','Perfect for puzzles up to 1500 pieces. Mat measures 116.8cm x 66.04cm - 46\" x 26\"','STORAGE',NULL,NULL,NULL,NULL,NULL,'16.08','19.30',16,5,15),
 ('2501GB','GIB','1940s Shopping Basket',NULL,'PUZZLE','Food and Drink',1000,'Standard','Standard','Standard','20.90','25.08',11,0,75),
 ('2502GB','GIB','1950s Shopping Basket',NULL,'PUZZLE','Food and Drink',1000,'Standard','Standard','Standard','20.90','25.08',6,0,55),
 ('2503GB','GIB','1960s Shopping Basket',NULL,'PUZZLE','Food and Drink',1000,'Standard','Standard','Standard','20.90','25.08',14,0,90),
 ('2504GB','GIB','1970s Shopping Basket',NULL,'PUZZLE','Food and Drink',1000,'Standard','Standard','Standard','20.90','25.08',9,0,60),
