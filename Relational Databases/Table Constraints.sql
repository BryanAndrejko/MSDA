-- test scripot - broken, due to double FK
CREATE TABLE NewOrderTbl (
    OrdNo char(8) NOT NULL,
    OrdDate date NOT NULL,
    CustNo char(8),
    EmpNo char(8),
    PRIMARY KEY (OrdNo),
    CONSTRAINT fk_Customer
	FOREIGN KEY (CustNo)
		REFERENCES Customer (CustNo)
    FOREIGN KEY (EmpNo)
    	REFERENCES Employee (EmpNo)
);

-- this works
CREATE TABLE NewOrderTbl (
    OrdNo char(8) NOT NULL,
    OrdDate date NOT NULL,
    CustNo char(8),
    EmpNo char(8),
    PRIMARY KEY (OrdNo),
    CONSTRAINT fk_Customer
	FOREIGN KEY (CustNo)
		REFERENCES Customer(CustNo)
);

--this works better, mutiple contratins
CREATE TABLE NewOrderTbl3 (
    OrdNo char(8) NOT NULL,
    OrdDate date NOT NULL,
    CustNo char(8),
    EmpNo char(8),
    PRIMARY KEY (OrdNo),
    CONSTRAINT fk_Customer
	FOREIGN KEY (CustNo) REFERENCES Customer (CustNo),
	CONSTRAINT fk_Employee
    FOREIGN KEY (EmpNo) REFERENCES Employee (EmpNo)
);

-- working with delete and updates
CREATE TABLE OrderTbl (
    OrdNo char(8) NOT NULL,
    OrdDate date NOT NULL,
    CustNo char(8),
    EmpNo char(8),
    PRIMARY KEY (OrdNo),
    CONSTRAINT fk_Customer
	  FOREIGN KEY (CustNo) REFERENCES Customer (CustNo),
	  CONSTRAINT fk_Employee
    FOREIGN KEY (EmpNo) REFERENCES Employee (EmpNo)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION
);
