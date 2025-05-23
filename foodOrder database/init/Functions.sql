USE food_order;

--Get price by food item id
DELIMITER $$

CREATE FUNCTION fn_get_food_price(fid VARCHAR(10)) 
RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
  DECLARE f_price DECIMAL(6,2);
  SELECT price INTO f_price FROM fooditem WHERE FooditemID = fid;
  RETURN f_price;
END$$

DELIMITER ;


--Get student name by order id
DELIMITER $$

CREATE FUNCTION fn_get_student_name_by_order(oid VARCHAR(10))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  DECLARE s_name VARCHAR(100);
  SELECT s.ST_Name INTO s_name
  FROM foodorder f
  JOIN student s ON f.ST_ID = s.ST_ID
  WHERE f.OrderID = oid;
  RETURN s_name;
END$$

DELIMITER ;

--Get payment method by order id--
DELIMITER $$

CREATE FUNCTION fn_get_payment_method(oid VARCHAR(10))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  DECLARE method VARCHAR(20);

  SELECT p.method
  INTO method
  FROM payment p
  WHERE p.OrderID = oid
  LIMIT 1;

  RETURN IFNULL(method, 'NOT FOUND');
END$$

DELIMITER ;

--Get total paid amount by studen id--
DELIMITER $$

CREATE FUNCTION fn_get_total_payment_by_student(sid VARCHAR(10))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE total DECIMAL(10,2);
  SELECT SUM(p.amount) INTO total
  FROM payment p
  JOIN foodorder f ON p.OrderID = f.OrderID
  WHERE f.ST_ID = sid;
  
  RETURN IFNULL(total, 0);
END$$

DELIMITER ;





