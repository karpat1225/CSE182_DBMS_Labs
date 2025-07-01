SELECT DISTINCT c.customerName AS theCustomerName, p.address AS thePharmacyAddress, pur.totalPrice AS theTotalPrice
FROM Customer c
JOIN Purchase pur ON c.customerID = pur.customerID
JOIN Pharmacy p ON pur.pharmacyID = p.pharmacyID
WHERE customerNAME LIKE 'R%' AND numEmployees = 12 AND totalPrice > 40.00;

