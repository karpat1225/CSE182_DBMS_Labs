CREATE TABLE Customer(
  customerID INT PRIMARY KEY,
  customerName VARCHAR(40) NOT NULL,
  address VARCHAR(50),
  dateOfBirth DATE,
  healthInsuranceName VARCHAR(40),
  UNIQUE (customerName, address)
);

CREATE TABLE Pharmacy(
  pharmacyID INT PRIMARY KEY,
  address VARCHAR(50) NOT NULL UNIQUE,
  openTime TIME,
  closeTime TIME,
  numEmployees INT
);

CREATE TABLE Drug(
  drugID INT PRIMARY KEY,
  drugName VARCHAR(40) NOT NULL,
  manufacturer VARCHAR(40),
  prescriptionRequired BOOLEAN
);

CREATE TABLE Supplier(
  supplierID INT PRIMARY KEY,
  supplierName VARCHAR(40) NOT NULL UNIQUE,
  rating INT
);

CREATE TABLE Purchase(
  purchaseID INT PRIMARY KEY,
  customerID INT,
  pharmacyID INT,
  purchaseTimestamp TIMESTAMP,
  totalPrice NUMERIC(8, 2),
  creditCardType CHAR(1),
  creditCardNumber INT,
  expirationDate DATE,
  FOREIGN KEY (customerID) REFERENCES Customer(customerID),
  FOREIGN KEY (pharmacyID) REFERENCES Pharmacy(pharmacyID),
  UNIQUE (purchaseTimestamp, creditCardType, creditCardNumber)
);

CREATE TABLE DrugsInPurchase(
  purchaseID INT,
  drugID INT,
  quantity INT,
  subtotal NUMERIC(8, 2),
  discount INT,
  PRIMARY KEY (purchaseID, drugID),
  FOREIGN KEY (purchaseID) REFERENCES Purchase(purchaseID),
  FOREIGN KEY (drugID) REFERENCES Drug(drugID)
);

CREATE TABLE OrderSupply(
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

