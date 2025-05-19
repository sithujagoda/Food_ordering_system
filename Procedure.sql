USE food_order;

DELIMITER $$

CREATE PROCEDURE GetOrdersByCustomer
    @CustomerID VARCHAR(10)
AS
BEGIN
    SELECT 
        o.OrderID,
        o.OrderDate,
        o.Status
    FROM 
        foodorder o
    WHERE 
        o.CustomerID = @CustomerID;
END;

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE InsertOrderDetail
    @OrderID VARCHAR(10),
    @FooditemID VARCHAR(10),
    @Quantity INT
AS
BEGIN
    INSERT INTO orderdetails (OrderID, FooditemID, Quantity)
    VALUES (@OrderID, @FooditemID, @Quantity);
END;

DELIMITER ;
