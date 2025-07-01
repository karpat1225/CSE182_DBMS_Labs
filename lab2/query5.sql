SELECT DISTINCT pharmacyID AS thePharmacyID, supplierID AS theSupplierID
FROM OrderSupply
WHERE orderDate = (SELECT MIN(orderDate) FROM OrderSupply);