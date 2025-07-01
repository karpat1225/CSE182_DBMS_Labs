SELECT DISTINCT o.supplierID as theSupplierID
FROM OrderSupply o
JOIN Supplier s ON o.supplierID = s.supplierID
WHERE s.supplierName != 'McKesson'
GROUP BY o.supplierID, o.drugID
HAVING COUNT(DISTINCT o.pharmacyID) >= 2
