SELECT DISTINCT c.address, c.customerID
FROM Customer c
WHERE c.customerID IN(
    SELECT p.customerID
    FROM Purchase p
    WHERE p.creditCardType = 'V'
)
AND c.customerID NOT IN(
    SELECT p.customerID
    FROM Purchase p
    WHERE p.totalPrice > 100.00
)
ORDER BY c.address DESC, c.customerID ASC;