--Schema Setup--
DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

--Customer Table--
CREATE TABLE Customer (
    customerID INT PRIMARY KEY,
    customerName VARCHAR(40),
    address VARCHAR(50),
    dateOfBirth DATE,
    healthInsuranceName VARCHAR(40)
);

-- Pharmacy Table--
CREATE TABLE Pharmacy (
    pharmacyID INT PRIMARY KEY,
    address VARCHAR(50),
    openTime TIME(0),
    closeTime TIME(0),
    numEmployees INT
);

-- Drug Table--
CREATE TABLE Drug (
    drugID INT PRIMARY KEY,
    drugName VARCHAR(40),
    manufacturer VARCHAR(40),
    prescriptionRequired BOOLEAN
);

-- Supplier Table--
CREATE TABLE Supplier (
    supplierID INT PRIMARY KEY,
    supplierName VARCHAR(40),
    rating INT
);

-- Purchase Table--
CREATE TABLE Purchase (
    purchaseID INT PRIMARY KEY,
    customerID INT,
    pharmacyID INT,
    purchaseTimestamp TIMESTAMP,
    totalPrice NUMERIC(8, 2),
    creditCardType CHAR(1),
    creditCardNumber INT,
    expirationDate DATE,
    FOREIGN KEY (customerID) REFERENCES Customer(customerID),
    FOREIGN KEY (pharmacyID) REFERENCES Pharmacy(pharmacyID)
);

-- DrugsInPurchase Table--
CREATE TABLE DrugsInPurchase (
    purchaseID INT,
    drugID INT,
    quantity INT,
    subtotal NUMERIC(8, 2),
    discount INT,
    PRIMARY KEY (purchaseID, drugID),
    FOREIGN KEY (purchaseID) REFERENCES Purchase(purchaseID),
    FOREIGN KEY (drugID) REFERENCES Drug(drugID)
);

-- Order Suppply Table--
CREATE TABLE OrderSupply (
    pharmacyID INT,
    supplierID INT,
    drugID INT,
    drugPrice NUMERIC(8, 2),
    quantity INT,
    orderDate DATE,
    status CHAR(4),
    PRIMARY KEY (pharmacyID, supplierID, drugID),
    FOREIGN KEY (pharmacyID) REFERENCES Pharmacy(pharmacyID),
    FOREIGN KEY (supplierID) REFERENCES Supplier(supplierID),
    FOREIGN KEY (drugID) REFERENCES Drug(drugID)
);

