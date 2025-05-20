USE food_order;

CREATE OR REPLACE VIEW View_OrderDetails_With_Items AS
SELECT
    od.OrderID,
    od.FooditemID,
    fi.name AS ItemName,
    od.quantity
FROM
    orderdetails od
JOIN
    fooditem fi ON od.FooditemID = fi.FooditemID;
    

CREATE OR REPLACE VIEW View_Orders_Total_Quantity AS
SELECT
    OrderID,
    SUM(quantity) AS TotalQuantity
FROM
    orderdetails
GROUP BY
    OrderID;

-- test    
SELECT * FROM View_OrderDetails_With_Items;
SELECT * FROM View_Orders_Total_Quantity;
