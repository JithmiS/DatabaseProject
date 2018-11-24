CREATE TABLE customer_seq(
  customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);


DELIMITER $$
CREATE TRIGGER customers_insert BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
	DECLARE role VARCHAR(5);
	DECLARE message_text VARCHAR(100);
	
	INSERT INTO customer_seq VALUES (NULL);
	IF NEW.customer_role='end customer' THEN
		SET role = 'EN';
	ELSEIF NEW.customer_role = 'wholesaler' THEN
		SET role = "WS";
	ELSEIF NEW.customer_role = 'retailer' THEN
		SET role = "RT";
	END IF;
	SET NEW.customer_id = CONCAT(role, LPAD(LAST_INSERT_ID(), 3, '0'));
  
  
END$$
DELIMITER ;

