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
	DECLARE unit_size INT(100);
	
	SET unit_price = (SELECT price from products where product_id = new.product_id);
	SET NEW.price = unit_price*new.quantity;
	
	SET unit_size = (SELECT train_capacity_consumption from products where product_id = new.product_id);
	SET NEW.train_capacity_consumption = unit_size*new.quantity;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER order_update AFTER INSERT ON order_product
FOR EACH ROW
BEGIN
	UPDATE orders
	SET order_price = order_price + NEW.price
	WHERE orders.order_number=NEW.order_number;
	
	UPDATE orders
	SET order_size = order_size + NEW.train_capacity_consumption
	WHERE orders.order_number=NEW.order_number;
	
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER status_update BEFORE UPDATE ON orders
FOR EACH ROW
BEGIN
		DECLARE store INT(100);
		DECLARE train VARCHAR(100);
		DECLARE allocated_cap INT(100);
		DECLARE trn_trip_no INT(100);
		DECLARE filled_cap INT(100);
		DECLARE last_train_trip_date DATE;
		
		DECLARE trkschedule_id INT(100);
		DECLARE trk_trip_no INT(100);
		DECLARE chk_time TIME;
		DECLARE chk_date DATE;
		DECLARE next_date DATE;
	IF (NEW.delivery_status = 'ISSUED') THEN
		SET NEW.issued_date=(SELECT CURDATE());
		SET store = (SELECT city_store_id FROM truckRoutes WHERE truckRoutes.route_no = NEW.route_no );
		SET train = (SELECT train_schedule_id FROM trainSchedule WHERE city_store_id=store);
		SET allocated_cap = (SELECT allocated_capacity FROM trainSchedule WHERE train_schedule_id=train);
		SET trn_trip_no = (SELECT train_trip_no FROM trainTrips WHERE train_schedule_id=train AND train_trip_date=ADDDATE(NEW.issued_date, INTERVAL 1 DAY));
		SET last_train_trip_date =  (SELECT MAX(train_trip_date) FROM trainTrips);
		IF trn_trip_no IS NULL THEN 
			INSERT INTO trainTrips(train_schedule_id,train_trip_date,filled_capacity) VALUES(train,ADDDATE(NEW.issued_date, INTERVAL 1 DAY),NEW.order_size);
			SET NEW.train_trip_no = LAST_INSERT_ID();
		ELSE 
			SET filled_cap= (SELECT filled_capacity from trainTrips where train_trip_no = trn_trip_no);
			IF (NEW.order_size <= (allocated_cap-filled_cap))=1 THEN
				UPDATE trainTrips
				SET filled_capacity = filled_capacity+NEW.order_size
				WHERE trainTrips.train_trip_no = trn_trip_no;
				SET NEW.train_trip_no = trn_trip_no;
			ELSE 
				INSERT INTO trainTrips(train_schedule_id,train_trip_date,filled_capacity) VALUES(train,ADDDATE(last_train_trip_date, INTERVAL 1 DAY),NEW.order_size);
				SET NEW.train_trip_no = LAST_INSERT_ID();
			END IF;
		END IF;	
	END IF;
	
	IF (NEW.delivery_status = 'CHECKED') THEN
		SET chk_time = (SELECT CURTIME());
		SET chk_date = (SELECT CURDATE());
		SET next_date = (ADDDATE(chk_date, INTERVAL 1 DAY));
		SET trkschedule_id = (SELECT truck_schedule_id FROM truckSchedule WHERE route_no = NEW.route_no AND chk_time <= starting_time ORDER BY starting_time LIMIT 1);
		IF trkschedule_id IS NULL THEN
			SET trkschedule_id = (SELECT truck_schedule_id FROM truckSchedule WHERE route_no = NEW.route_no ORDER BY starting_time LIMIT 1);
			SET trk_trip_no= (SELECT truck_trip_no FROM truckTrips WHERE truck_schedule_id= trkschedule_id AND truck_scheduled_date= next_date);
			IF trk_trip_no IS NULL THEN
				INSERT INTO truckTrips(truck_schedule_id,truck_scheduled_date) VALUES(trkschedule_id, ADDDATE(chk_date, INTERVAL 1 DAY));
				SET NEW.truck_trip_no = LAST_INSERT_ID();
			ELSE
				SET NEW.truck_trip_no = trk_trip_no;
			END IF;
			
		ELSE 
			SET trk_trip_no= (SELECT truck_trip_no FROM truckTrips WHERE truck_schedule_id= trkschedule_id AND truck_scheduled_date=chk_date);
			IF trk_trip_no IS NULL THEN
				INSERT INTO truckTrips(truck_schedule_id,truck_scheduled_date) VALUES(trkschedule_id, chk_date);
				SET NEW.truck_trip_no = LAST_INSERT_ID();
			ELSE
				SET NEW.truck_trip_no = trk_trip_no;
			END IF;
		END IF;
		SET NEW.checked_time= chk_time;
		SET NEW.checked_date= chk_date;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER truck_trip_update BEFORE UPDATE ON truckTrips
FOR EACH ROW
BEGIN
	DECLARE done INT DEFAULT FALSE;
	DECLARE route INT(100);
	DECLARE city INT(100);
	DECLARE dr_id INT(100);
	DECLARE last_tr_o INT(100);
	DECLARE cur1 CURSOR FOR SELECT driver_id,last_trip_no FROM drivers WHERE city_store_id = city;
	SET route = (SELECT route_no from truckSchedule WHERE truck_schedule_id = NEW.truck_schedule_id);
	SET city = (SELECT city_store_id from truckRoutes WHERE route_no = route);
	
	OPEN cur1
	read_loop: LOOP
	FETCH cur1 INTO dr_id, last_tr_no
		IF done THEN
		  LEAVE read_loop;
		END IF;
		
		
		
	END LOOP;
	CLOSE cur1
	DEALLOCATE cur1
	
END$$
DELIMITER ;