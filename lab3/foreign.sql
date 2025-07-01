-- Foreign 1 --
ALTER TABLE Purchase
ADD CONSTRAINT foreign_pur_cust
FOREIGN KEY (customerID) 
REFERENCES Customer(customerID)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Foreign 2 --
ALTER TABLE Purchase
ADD CONSTRAINT foreign_pur_phar
FOREIGN KEY (pharmacyID)
REFERENCES Pharmacy(pharmacyID)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- Foreign 3 --
ALTER TABLE DrugsInPurchase
ADD CONSTRAINT foreign_dip_pur
FOREIGN KEY (purchaseID)
REFERENCES Purchase(purchaseID)
ON DELETE CASCADE
ON UPDATE CASCADE;

