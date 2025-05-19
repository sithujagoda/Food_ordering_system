use food_order;
DELIMITER $$

CREATE VIEW View_OrderDetails_With_Items AS
SELECT
od.OrderID,
od.FooditemID,
fi.ItemName,
od.Quantity
FROM
orderdetails od
JOIN
fooditem fi ON od.FooditemID = fi.FooditemID;

DELIMITER ;

DELIMITER $$

CREATE VIEW View_Orders_Total_Quantity AS
SELECT
OrderID,
SUM(Quantity) AS TotalQuantity
FROM
orderdetails
GROUP BY
OrderID;

DELIMITER ;