USE food_order;

DELIMITER $$

CREATE PROCEDURE InsertOrderDetail(
    IN oid VARCHAR(10),
    IN fid VARCHAR(10),
    IN qty INT
)
BEGIN
    INSERT INTO orderdetails (OrderID, FooditemID, quantity)
    VALUES (oid, fid, qty);
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE GetOrdersByStudentID(
    IN sid VARCHAR(10)
)
BEGIN
    SELECT 
        o.OrderID,
        o.Order_date
    FROM 
        foodorder o
    WHERE 
        o.ST_ID = sid;
END$$

DELIMITER ;

CALL InsertOrderDetail('O001', 'F005', 3);
CALL GetOrdersByStudentID('21456');
