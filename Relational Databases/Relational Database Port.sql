
-- test run EMPLOY table create, first attempt WORKS
CREATE TABLE Employee (
    Emp_Id integer NOT NULL,
    Emp_First char(15) NOT NULL,
    Emp_Last char(20) NOT NULL,
    Emp_Hire date NOT NULL,
    PRIMARY KEY (Emp_Id)
);

-- test run CUST table create, first attempt WORKS
CREATE TABLE Customer (
    Cust_Id integer NOT NULL,
    Cust_First char(15) NOT NULL,
    Cust_Last char(25) NOT NULL,
    Phone_Num char(12) NOT NULL,
    Email char(20) NOT NULL,
    Address char(20),
    City char(30),
    State char(2),
    Zip char(10),
    Company_Name char(30),
    PRIMARY KEY (Cust_Id)
);

-- test run TOOL table create, first attempt WORKS
CREATE TABLE Tool (
    Tool_Id integer NOT NULL,
    Manufacturer char(15) NOT NULL,
    Serial_Num char(15) NOT NULL,
    Supplier char(20) NOT NULL,
    Tool_Power char(20) NOT NULL,
    Type char(20) NOT NULL,
    Cost numeric(4,2) NOT NULL,
    Insurance numeric(4,2) NOT NULL,
    New_Date date NOT NULL,
    PRIMARY KEY (Tool_Id)
);

-- test run RENTAL table create, CHECKING DELETE CONSTRAINT
-- WORKS for all cascades - deletes down
-- Allows child delete
CREATE TABLE Rental (
    Rent_No integer NOT NULL,
    Rent_Date date NOT NULL,
    Cust_Id integer,
    Tool_Id integer NOT NULL,
    Emp_Id integer,
    Invoice_Num integer,
    Pay_Type char(8),
    PRIMARY KEY (Rent_No),
    CONSTRAINT fk_Customer
	  FOREIGN KEY (Cust_Id) REFERENCES Customer (Cust_Id) ON DELETE CASCADE,
	  CONSTRAINT fk_Employee
    FOREIGN KEY (Emp_Id) REFERENCES Employee (Emp_Id) ON DELETE CASCADE,
    CONSTRAINT fk_Tool
    FOREIGN KEY (Tool_Id) REFERENCES Tool (Tool_Id) ON DELETE CASCADE
	  ON UPDATE NO ACTION
);


-- test run RENTAL table create, first attempt WORKS
-- Old WORKS - does not allow for DELETE from Child table
CREATE TABLE Rental (
    Rent_No integer NOT NULL,
    Rent_Date date NOT NULL,
    Cust_Id integer,
    Tool_Id integer NOT NULL,
    Emp_Id integer,
    Invoice_Num integer,
    Pay_Type char(8),
    PRIMARY KEY (Rent_No),
    CONSTRAINT fk_Customer
	  FOREIGN KEY (Cust_Id) REFERENCES Customer (Cust_Id),
	  CONSTRAINT fk_Employee
    FOREIGN KEY (Emp_Id) REFERENCES Employee (Emp_Id),
    CONSTRAINT fk_Tool
    FOREIGN KEY (Tool_Id) REFERENCES Tool (Tool_Id)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION
);

-- Instert Template of Table Data from previous CT
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

-- Test Run INSERT Tool Values WORKS
INSERT INTO Tool (Tool_Id,Manufacturer,Serial_Num,Supplier,Tool_Power,Type,Cost,Insurance,New_Date) VALUES
    (12345,'Bosch','XY3A','Supplier A','Battery','Indoor',49.99,4.99,'2019-11-17'),
    (23456,'Craftsman','ZZ45Y','Supplier B','AC','Indoor',37.99,3.79,'2019-11-07'),
    (34567,'DeWalt','104567','Supplier 3','Fuel','Garden',12.95,1.99,'2018-10-31'),
    (45678,'Kobalt','UT453Y','Supplier B','Fuel','Garden',11.85,1.99,'2017-10-17'),
    (56789,'Makita','JJKK7','Supplier 3','Battery','Outdoor',24.95,2.49,'2017-10-07');

-- Test Run INSERT Customer Values WORKS
INSERT INTO Customer (Cust_Id,Cust_First,Cust_Last,Phone_Num,Email,Address,City,State,Zip,Company_Name) VALUES
    (98765,'Reggie','Haseltine','123-456-7890','reggie@aol.com','123 Main','Denver','CO','80220','Best Co'),
    (87654,'Geroge','Doe','456-789-5454','george@aol.com','558 Jones','Lakewood','CO','80228','Better Co'),
    (76543,'Bob','Jones','889-556-8899','bob@aol.com','997 Sunrise','Englewood','CO','80110','Really Best'),
    (65432,'Mike','Smith','236-559-6464','mike@aol.com','887 Main','Littleton','CO','80128',null),
    (54321,'Sam','Michaels','235-998-7421','sam@aol.com','123 Cedar','Denver','CO','80221',null);

-- Test Run INSERT Employee Values WORKS
INSERT INTO Employee (Emp_Id,Emp_First,Emp_Last,Emp_Hire) VALUES
    (101,'Steve','Jobs','2019-10-17'),
    (201,'Elon','Musk','2019-10-27'),
    (301,'Bill','Gates','2017-01-30'),
    (401,'Henry','Ford','2016-10-27'),
    (501,'Steve','Woz','2016-10-17');

-- Test Run INSERT Rental Values WORKS
INSERT INTO Rental (Rent_No,Rent_Date,Cust_Id,Tool_Id,Emp_Id,Invoice_Num,Pay_Type) VALUES
    (1101,'2020-11-17',98765,12345,101,887766,'Cash'),
    (1202,'2020-11-07',87654,23456,201,776655,'Credit'),
    (1303,'2020-10-31',76543,34567,301,665544,'Check'),
    (1404,'2020-10-17',65432,45678,401,554433,'Cash'),
    (1505,'2020-10-07',54321,56789,501,443322,'Credit');
--Check contrainst with trigger for 1-3 rentals
-- ouside scope of class, mention business rule

-- SQL Quieries Problem #1 WORKS
SELECT Cust_First, Cust_Last, Cust_Id, Address, Zip FROM Customer
    ORDER BY Cust_Id

-- Basic Left JOIN WORKS with WHERE clause > for last 30
SELECT Tool.Tool_Id, Tool.Manufacturer, Tool.Serial_Num, Rental.Rent_No, Rental.Rent_Date
FROM Tool
LEFT JOIN Rental ON Tool.Tool_Id = Rental.Tool_Id
WHERE Rental.Rent_Date > '2020-10-28'
ORDER BY Rental.Rent_Date;

-- practice UPDATE statement WORKING
UPDATE Customer
SET Cust_Last = 'NewName'
WHERE Cust_Id = 98765

-- practice DELETE statement WORKS when cust not in rental, WORKS for all
-- Needs ON DELETE Contstraint in DDL
DELETE FROM Customer WHERE cust_id = 98765

-- Sample from GCP  AW practice
-- this is my comment to select SELECT * FROM `finances.Location` WHERE Active = True ORDER BY Office DESC

-- this is the PL  SELECT Office, revenue FROM `finances.PandL` WHERE Date = '2020-03-01'

SELECT A.Office, LocationName, revenue
FROM `finances.Location` A
LEFT JOIN `finances.PandL` B
  ON A.Office = B.Office
WHERE Date = '2020-03-01'

--SELECT column_name(s)
--FROM table_1
--LEFT JOIN table_2
  --##ON table_1.column_name = table_2.column_name;

-- Left Join Example - select all Custom, and orders they have
  SELECT Customers.CustomerName, Orders.OrderID
  FROM Customers
  LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  ORDER BY Customers.CustomerName;

-- Basic Left JOIN WORKS
SELECT Tool.Tool_Id, Tool.Manufacturer, Tool.Serial_Num, Rental.Rent_No, Rental.Rent_Date
FROM Tool
LEFT JOIN Rental ON Tool.Tool_Id = Rental.Tool_Id
ORDER BY Rental.Rent_Date;

-- Basic Left JOIN WORKS with WHERE clause =
SELECT Tool.Tool_Id, Tool.Manufacturer, Tool.Serial_Num, Rental.Rent_No, Rental.Rent_Date
FROM Tool
LEFT JOIN Rental ON Tool.Tool_Id = Rental.Tool_Id
WHERE Rental.Rent_Date = '2020-10-07'
ORDER BY Rental.Rent_Date;

-- Basic Left JOIN WORKS with WHERE clause > for last 30
SELECT Tool.Tool_Id, Tool.Manufacturer, Tool.Serial_Num, Rental.Rent_No, Rental.Rent_Date
FROM Tool
LEFT JOIN Rental ON Tool.Tool_Id = Rental.Tool_Id
WHERE Rental.Rent_Date > '2020-10-28'
ORDER BY Rental.Rent_Date;

