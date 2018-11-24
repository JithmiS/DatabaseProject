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

DELIMITER $$
CREATE TRIGGER order_product_insert BEFORE INSERT ON order_product
FOR EACH ROW
BEGIN
	DECLARE unit_price DECIMAL(12,2);
	SET unit_price = (SELECT price from products where product_id = new.product_id);
	SET NEW.price = unit_price*new.quantity;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER order_insert  after insert ON orders
for each row
BEGIN
	insert into orders (order_price) values
	(select total from (SELECT order_number, SUM(price) as total from order_product group by order_product.order_number ) as t
	where orders.order_number=t.order_number) ;
	
END$$
DELIMITER ;