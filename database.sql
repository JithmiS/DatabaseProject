CREATE database supplychain1;

USE supplychain1;

CREATE TABLE users( 
	user_id INT(100) NOT NULL AUTO_INCREMENT,
	email VARCHAR(100) NOT NULL , 
	password VARCHAR(50) NOT NULL ,
	role VARCHAR(100) NOT NULL ,
	is_deleted TINYINT(1) NOT NULL,
	PRIMARY KEY (user_id)
);

CREATE TABLE cityStores(
	city_store_id INT(100) NOT NULL AUTO_INCREMENT,
	city_name VARCHAR(100) NOT NULL,
	PRIMARY KEY (city_store_id)
);

CREATE TABLE managers( 
	manager_id INT(100) NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(100) NOT NULL , 
	last_name VARCHAR(100) NOT NULL ,
	email VARCHAR(100) NOT NULL ,
	address VARCHAR(100) NOT NULL ,
	contact_number VARCHAR(10) NOT NULL,
	password VARCHAR(50) NOT NULL ,
	is_deleted TINYINT(1) NOT NULL,
	PRIMARY KEY (manager_id)
);

CREATE TABLE storeManagers( 
	store_manager_id INT(100) NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(100) NOT NULL , 
	last_name VARCHAR(100) NOT NULL ,
	email VARCHAR(100) NOT NULL ,
	address VARCHAR(100) NOT NULL ,
	contact_number VARCHAR(10) NOT NULL,
	city_store_id INT(100) NOT NULL,
	password VARCHAR(50) NOT NULL ,
	is_deleted TINYINT(1) NOT NULL,
	PRIMARY KEY (store_manager_id),
	FOREIGN KEY (city_store_id) REFERENCES cityStores(city_store_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE customers( 
	customer_id VARCHAR(100) NOT NULL,
	first_name VARCHAR(100) NOT NULL , 
	last_name VARCHAR(100) NOT NULL , 
	customer_role ENUM('end customer','wholesaler','retailer'),
	email VARCHAR(100) NOT NULL ,
	address VARCHAR(100) NOT NULL ,
	contact_number VARCHAR(10) NOT NULL,
	password VARCHAR(50) NOT NULL ,
	is_deleted TINYINT(1) NOT NULL,
	PRIMARY KEY (customer_id)
);

CREATE TABLE trainSchedule(
	train_schedule_id VARCHAR(100) NOT NULL ,
	allocated_capacity INT(100) NOT NULL,
	departure_time TIME NOT NULL,
	reaching_time TIME,
	city_store_id INT(100) NOT NULL,
	PRIMARY KEY (train_schedule_id),
	FOREIGN KEY (city_store_id) REFERENCES cityStores(city_store_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE trainTrips(
	train_trip_no INT(100) NOT NULL AUTO_INCREMENT,
	filled_capacity INT(100) DEFAULT 0,
	train_schedule_id VARCHAR(100),
	train_trip_date DATE,
	PRIMARY KEY (train_trip_no)	,
	FOREIGN KEY (train_schedule_id) REFERENCES trainSchedule(train_schedule_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE truckRoutes(
	route_no INT(100) NOT NULL AUTO_INCREMENT,
	streets VARCHAR(100) NOT NULL,
	maximum_time TIME NOT NULL,
	city_store_id INT(100) NOT NULL,
	PRIMARY KEY (route_no),
	FOREIGN KEY (city_store_id) REFERENCES cityStores(city_store_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE trucks(
	truck_no VARCHAR(100) NOT NULL,
	truck_owner VARCHAR(100) NOT NULL,
	city_store_id INT(100) NOT NULL,
	details VARCHAR(100),
	PRIMARY KEY (truck_no),
	FOREIGN KEY (city_store_id) REFERENCES cityStores(city_store_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE orders( 

	order_number INT(100) NOT NULL AUTO_INCREMENT,
	customer_id VARCHAR(100) NOT NULL , 
	to_building_number VARCHAR(100) NOT NULL , 
	to_street VARCHAR(100) NOT NULL ,
	to_city VARCHAR(100) NOT NULL ,
	delivery_status VARCHAR(100) DEFAULT 'PENDING',
	order_price DECIMAL(12,2) DEFAULT 0,
	order_size INT(100) DEFAULT 0,
	route_no INT(100) NOT NULL,
	issued_date DATE,
	checked_time TIME,
	checked_date DATE,
	train_trip_no INT(100), 
	truck_trip_no INT(100),
	PRIMARY KEY (order_number),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (route_no) REFERENCES truckRoutes(route_no) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (train_trip_no) REFERENCES trainTrips(train_trip_no) ON DELETE CASCADE ON UPDATE CASCADE
	
);

CREATE TABLE products(
	product_id INT(100) NOT NULL AUTO_INCREMENT,
	product_name VARCHAR(100) NOT NULL ,
	train_capacity_consumption INT(100) NOT NULL ,
	price DECIMAL(12,2) NOT NULL,
	PRIMARY KEY (product_id)
	
);

CREATE TABLE order_product(
	order_number INT(100) NOT NULL,
	product_id INT(100) NOT NULL,
	quantity INT(100) NOT NULL,
	price DECIMAL(12,2) NOT NULL,
	train_capacity_consumption INT(100) NOT NULL ,
	PRIMARY KEY(order_number,product_id),
	FOREIGN KEY (order_number) REFERENCES orders(order_number) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE
);

/* CREATE TABLE inventory(
	product_id INT(100) NOT NULL AUTO_INCREMENT,
	product_name VARCHAR(100) NOT NULL ,
); */

CREATE TABLE drivers(
	driver_id INT(100) NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(100) NOT NULL , 
	last_name VARCHAR(100) NOT NULL ,
	email VARCHAR(100) NOT NULL ,
	address VARCHAR(100) NOT NULL ,
	contact_number VARCHAR(10) NOT NULL,
	city_store_id INT(100) NOT NULL,
	password VARCHAR(50) NOT NULL ,
	is_deleted TINYINT(1) NOT NULL,
	PRIMARY KEY (driver_id),
	FOREIGN KEY (city_store_id) REFERENCES cityStores(city_store_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE assistantDrivers(
	assistant_driver_id INT(100) NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(100) NOT NULL , 
	last_name VARCHAR(100) NOT NULL ,
	email VARCHAR(100) NOT NULL ,
	address VARCHAR(100) NOT NULL ,
	contact_number VARCHAR(10) NOT NULL,
	city_store_id INT(100) NOT NULL,
	password VARCHAR(50) NOT NULL ,
	is_deleted TINYINT(1) NOT NULL,
	PRIMARY KEY (assistant_driver_id),
	FOREIGN KEY (city_store_id) REFERENCES cityStores(city_store_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE truckSchedule(
	truck_schedule_id INT(100) NOT NULL AUTO_INCREMENT,
	route_no INT(100) NOT NULL,
	starting_time TIME NOT NULL,
	truck_no VARCHAR(100) NOT NULL,
	finishing_time TIME,
	PRIMARY KEY (truck_schedule_id),
	FOREIGN KEY (route_no) REFERENCES truckRoutes(route_no) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (truck_no) REFERENCES trucks(truck_no) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE truckTrips(
	truck_trip_no INT(100) NOT NULL AUTO_INCREMENT,
	truck_schedule_id INT(100) NOT NULL,
	driver_id INT(100),
	assistant_driver_id INT(100),
	truck_scheduled_date DATE,
	PRIMARY KEY (truck_trip_no),
	FOREIGN KEY (truck_schedule_id) REFERENCES truckSchedule(truck_schedule_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (assistant_driver_id) REFERENCES assistantDrivers(assistant_driver_id)ON DELETE CASCADE ON UPDATE CASCADE
);
-- CREATE ROLE endcustomer;
-- GRANT SELECT ON customers TO endcustomer;

