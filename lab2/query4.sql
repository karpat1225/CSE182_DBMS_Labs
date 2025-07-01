SELECT DISTINCT dp.drugID AS theDrugID, pur.purchaseTimestamp AS thePurchaseTimestamp
FROM DrugsInPurchase dp
JOIN Purchase pur ON dp.purchaseID = pur.purchaseID
JOIN Pharmacy p ON pur.pharmacyID = p.pharmacyID
JOIN Drug d ON dp.drugID = d.drugID
WHERE d.prescriptionRequired = TRUE
    AND DATE(pur.purchaseTimestamp) >= '2024-01-12'
    AND p.address LIKE '%en%'
    AND dp.quantity >= 2
    AND pur.creditCardNumber IS NULL;