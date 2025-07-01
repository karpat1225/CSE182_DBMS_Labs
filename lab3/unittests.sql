-- Test 1 --
-- Violates the foreign key constraint on the Purchase table and Customer table --
INSERT INTO Purchase (purchaseID, customerID, pharmacyID, purchaseTimestamp, totalPrice, creditCardType, creditCardNumber, expirationDate)
VALUES (22, 100, 11, '2024-12-02 17:30:00', 50.00, 'V', '111111111', '2024-11-30');
-- customerID 100 does not exist in the Customer table --

-- Test 2 --
-- Violates the foreign key constraint on the Purchase table and Pharmacy table --
INSERT INTO Purchase (purchaseID, customerID, pharmacyID, purchaseTimestamp, totalPrice, creditCardType, creditCardNumber, expirationDate)
VALUES (23, 1, 100, '2024-12-02 17:30:00', 50.00, 'V', '111111111', '2024-11-30');
-- pharmacyID 100 does not exist in the Pharmacy table --

-- Test 3 --
-- Violates the foreign key constraint on the DrugsInPurchase table and Purchase table --
INSERT INTO DrugsInPurchase (purchaseID, drugID, quantity, subtotal, discount)
VALUES (100, 1, 2, 20.00, 0);
-- purchaseID 100 does not exist in the Purchase table --

-- Test 4 --
-- General Constraint 1: Success since numEmployees is greater than 0 --
UPDATE Pharmacy
SET numEmployees = 5
WHERE pharmacyID = 11;

-- Test 5 --
-- General Constraint 1: Violates the constraint since numEmployees is less than or equal to 0 --
UPDATE Pharmacy
SET numEmployees = 0
WHERE pharmacyID = 11;

-- Test 6 --
-- General Constraint 2: Success since status is one of the allowed values --
UPDATE OrderSupply
SET status = 'dlvd'
WHERE pharmacyID = 11 
AND supplierID = 1 
AND drugID = 1;

-- Test 7 --
-- General Constraint 2: Violates the constraint since status is not one of the allowed values --
UPDATE OrderSupply
SET status = 'aaaa'
WHERE pharmacyID = 11
AND supplierID = 1
AND drugID = 1;

-- Test 8 --
-- General Constraint 3: Success since creditCardType and creditCardNumber are both NULL --
UPDATE Purchase
SET creditCardType = NULL, creditCardNumber = NULL
WHERE purchaseID = 1;

-- Test 9 --
-- General Constraint 3: Violates the constraint since creditCardType is not NULL and creditCardNumber is NULL --
UPDATE Purchase
SET creditCardType = NULL, creditCardNumber = 111111111
WHERE purchaseID = 1;

