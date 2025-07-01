CREATE OR REPLACE FUNCTION
deleteSomeOrdersFunction (maxOrderDeletions INTEGER)
RETURNS INTEGER AS $$

DECLARE
    numDeleted          INTEGER;      
    theSupplierID       INTEGER;     
    futureOrdersCount   INTEGER; 

DECLARE deletionCursor CURSOR FOR
    SELECT s.supplierID
    FROM Supplier s
    JOIN OrderSupply os on s.supplierID = os.supplierID
    WHERE os.status = 'cnld'
    AND os.orderDate <= DATE '2024-01-05'
    GROUP BY s.supplierID, s.supplierName
    ORDER BY COUNT(*) DESC, s.supplierName;

BEGIN
    IF maxOrderDeletions <= 0 THEN
        RETURN -1;
    END IF;

    OPEN deletionCursor;
    numDeleted := 0;

    LOOP
        FETCH deletionCursor INTO theSupplierID;
        EXIT WHEN NOT FOUND;
        SELECT COUNT (*) INTO futureOrdersCount
        FROM OrderSupply os
        WHERE os.supplierID = theSupplierID AND orderDate > DATE '2024-01-05';
        
        IF numDeleted + futureOrdersCount <= maxOrderDeletions THEN
            DELETE FROM OrderSupply
            WHERE supplierID = theSupplierID AND orderDate > DATE '2024-01-05';
            numDeleted := numDeleted + futureOrdersCount;
        ELSE
            EXIT;
        END IF;
    END LOOP;
    CLOSE deletionCursor;
    RETURN numDeleted;
END
$$ LANGUAGE plpgsql;

