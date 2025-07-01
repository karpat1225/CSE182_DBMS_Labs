SELECT p.pharmacyID, ph.address, SUM(bt.totalPrice - bt.totalDrugPrice) AS totalPriceDifference, COUNT(*) AS badTotalPriceCount
FROM BadTotalPriceView bt
JOIN Pharmacy ph ON bt.pharmacyID = ph.pharmacyID
JOIN Purchase p ON bt.purchaseID = p.purchaseID
GROUP BY p.pharmacyID, ph.address;

-- Original output--

-- pharmacyid |           address            | totalpricedifference | badtotalpricecount
-- ------------+------------------------------+----------------------+--------------------
--         33 | 789 Elm Rd, Chicago, IL      |               -20.00 |                  1
--         22 | 456 Oak Ave, Los Angeles, CA |                20.00 |                  1
--         55 | 654 Cedar Dr, Phoenix, AZ    |                20.00 |                  2

-- Delete --

DELETE FROM DrugsInPurchase
WHERE purchaseID = 7 
AND drugID = 10;

SELECT p.pharmacyID, ph.address, SUM(bt.totalPrice - bt.totalDrugPrice) AS totalPriceDifference, COUNT(*) AS badTotalPriceCount
FROM BadTotalPriceView bt
JOIN Pharmacy ph ON bt.pharmacyID = ph.pharmacyID
JOIN Purchase p ON bt.purchaseID = p.purchaseID
GROUP BY p.pharmacyID, ph.address;

-- pharmacyid |           address            | totalpricedifference | badtotalpricecount
-- ------------+------------------------------+----------------------+--------------------
--         22 | 456 Oak Ave, Los Angeles, CA |                20.00 |                  1
--         55 | 654 Cedar Dr, Phoenix, AZ    |                20.00 |                  2