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

DELIMITER ;

DELIMITER $$

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
















