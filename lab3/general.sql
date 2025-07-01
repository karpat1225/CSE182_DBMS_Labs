-- General 1 --
ALTER TABLE Pharmacy
ADD CONSTRAINT pharmacyEmployeesPositive
CHECK (numEmployees > 0);

-- General 2 --
ALTER TABLE OrderSupply
ADD CONSTRAINT validOrderStatus
CHECK (status IN ('dlvd', 'pndg', 'cnld') OR status IS NULL);

-- General 3 --
ALTER TABLE Purchase
ADD CONSTRAINT ifNullTypeThenNullNumber
CHECK (creditCardType IS NOT NULL OR creditCardNumber IS NULL);

