USE food_order;

DELIMITER $$

CREATE TRIGGER trg_check_quantity_before_insert
BEFORE INSERT ON orderdetails
FOR EACH ROW
BEGIN
  IF NEW.quantity <= 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Quantity must be greater than 0';
  END IF;
END$$

CREATE TRIGGER trg_check_quantity_before_update
BEFORE UPDATE ON orderdetails
FOR EACH ROW
BEGIN
  IF NEW.quantity <= 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Quantity must be greater than 0';
  END IF;
END$$

DELIMITER ;

-- test
-- INSERT INTO orderdetails (OrderID, FooditemID, quantity) VALUES ('O002', 'F006', 0); 

-- INSERT INTO foodorder (OrderID, ST_ID, Order_date)
-- VALUES ('O011', '21456', '2025-05-20');

-- INSERT INTO orderdetails (OrderID, FooditemID, quantity)
-- VALUES ('O011', 'F006', 1);



