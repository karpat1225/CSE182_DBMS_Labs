BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Update --
UPDATE Supplier s
SET supplierName = us.supplierName, rating = s.rating + 1
FROM UpgradeSupplier us
WHERE s.supplierID = us.supplierID;

-- Insert --
INSERT INTO Supplier
SELECT us.supplierID, us.supplierName, 9
FROM UpgradeSupplier us
WHERE NOT EXISTS (
    SELECT * 
    FROM Supplier s
    WHERE s.supplierID = us.supplierID);

-- Commit --
COMMIT TRANSACTION