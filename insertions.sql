--adding users--
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('manager@gmail.com','Company','Manager','40/5,1st lane,Nawala','0714567234',password(1234),0);

INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('matarastoremanager@gmail.com','matara','storeManager','403/2, rahula road, Isadin town, Matara','0715457237',password(1234),0);
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('gallestoremanager@gmail.com','galle','galleManager','65/6,lighthouse street,galle','0715667209',password(1234),0);
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('colombostoremanager@gmail.com','colombo','storeManager','3/2,2nd lane, Rawatawatta, Moratuwa','0715667235',password(1234),0);

INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('tony@gmail.com','Tony','Stark','London','0712345678', password(1234),0);
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('jake@gmail.com','Jake','Peralta','Amsterdam','0712745678',password(2345),0);
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('amy@gmail.com','Amy','Santiago','Jaffna','0713445678',password(2345),0);
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('charly@gmail.com','Charles','David','Hambanthota','0713476878',password(78965),0);

INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('driver@gmail.com','Company','Driver','32/7,lousy street,Kottawa','0717697234',password(1234),0);
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('dhopinder@gmail.com','Dhopinder','Driver','89/9,1st street,galle','0717697890',password(1234),0);
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('terry@gmail.com','Terry','Driver','32/7,new street,Negombo','071723947',password(1234),0);
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('hardy@gmail.com','Hardy','Driver','32/7,old street, Ranna','0717697231',password(1234),0);
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('jim@gmail.com','Jim','Driver','32/7,flower road, Nuwara','0717697207',password(1234),0);

INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('assdriver@gmail.com','Assistant','Driver','362/7,anagarika MW, Matara','0717697721',password(1234),0);
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('nick@gmail.com','Nick','Driver','36/1,Queens street, Mahanuwara','0717697732',password(1234),0);
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('josh@gmail.com','Joseph','Driver','362/7,3rd avenue, Panadura','0717697694',password(1234),0);
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('cal@gmail.com','Calvin','Driver','90/9, heavens square, Doncaster','0717697745',password(1234),0);
INSERT INTO users(email, first_name, last_name, address, contact_number, password, is_deleted) VALUES('james@gmail.com','James','Driver','43/8, welegoda, Matara','0717697018',password(1234),0);

--adding manager--
INSERT INTO managers(email) VALUES('manager@gmail.com');

--adding city stores--
INSERT INTO citystores(city_name) VALUES ('Matara');
INSERT INTO citystores(city_name) VALUES ('Galle');
INSERT INTO citystores(city_name) VALUES ('Colombo');

--adding storeManagers--
INSERT INTO storeManagers(email,city_store_id) VALUES('matarastoremanager@gmail.com',1);
INSERT INTO storeManagers(email,city_store_id) VALUES('gallestoremanager@gmail.com',2);
INSERT INTO storeManagers(email,city_store_id) VALUES('colombostoremanager@gmail.com',3);

--adding customers to customers table--
INSERT INTO customers(customer_role,email) VALUES('end customer','tony@gmail.com');
INSERT INTO customers(customer_role,email) VALUES('end customer','jake@gmail.com');
INSERT INTO customers(customer_role,email) VALUES('wholesaler','amy@gmail.com');
INSERT INTO customers(customer_role,email) VALUES('retailer','charly@gmail.com');

--adding products----
INSERT INTO products(product_name, train_capacity_consumption, price) VALUES ('Electric Fan', 5, 2500.00);
INSERT INTO products(product_name, train_capacity_consumption, price) VALUES ('Electric Kettle', 2, 1200.00);
INSERT INTO products(product_name, train_capacity_consumption, price) VALUES ('Microwave Oven', 5, 4500.00);
INSERT INTO products(product_name, train_capacity_consumption, price) VALUES ('Refrigerator', 12, 20000.00);
INSERT INTO products(product_name, train_capacity_consumption, price) VALUES ('Lamp', 1, 500.00);

--adding routes---
INSERT INTO truckRoutes(streets, maximum_time, city_store_id) VALUES ('Matara-Dewundara-Gandara-Dikwella-Tangalle', '01:00:00', 1);
INSERT INTO truckRoutes(streets, maximum_time, city_store_id) VALUES ('Matara-Weligama-Habaraduwa-Ahangama', '01:30:00', 1);
INSERT INTO truckRoutes(streets, maximum_time, city_store_id) VALUES ('Maradana-Borella-Rajagiriya-pitakotte', '02:00:00', 3);

--adding orders-------
INSERT INTO Orders(customer_id,to_building_number,to_street,to_city,route_no) VALUES ('EN001','121/1','Weligama','Matara',2);
INSERT INTO Orders(customer_id,to_building_number,to_street,to_city,route_no) VALUES ('EN002','20/5','Gandara','Matara',1);
INSERT INTO Orders(customer_id,to_building_number,to_street,to_city,route_no) VALUES ('RT004','11/1','Ahangama','Matara',2);
INSERT INTO Orders(customer_id,to_building_number,to_street,to_city,route_no) VALUES ('WS003','10/3','Tangalle','Matara',1);
INSERT INTO Orders(customer_id,to_building_number,to_street,to_city,route_no) VALUES ('EN001','5/120','Habaraduwa','Matara',2);
INSERT INTO Orders(customer_id,to_building_number,to_street,to_city,route_no) VALUES ('EN002','2/145','Dickwella','Matara',1);
INSERT INTO Orders(customer_id,to_building_number,to_street,to_city,route_no) VALUES ('RT004','1/111','Dewundara','Matara',1);
INSERT INTO Orders(customer_id,to_building_number,to_street,to_city,route_no) VALUES ('WS003','5/142','Ahangama','Matara',2);
INSERT INTO Orders(customer_id,to_building_number,to_street,to_city,route_no) VALUES ('EN001','5/100','Gandara','Matara',1);
INSERT INTO Orders(customer_id,to_building_number,to_street,to_city,route_no) VALUES ('EN002','01/129','Kotte','Colombo',3);

--adding order_products---
INSERT INTO order_product(order_number, product_id, quantity) VALUES (1,1, 3);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (1,2, 1);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (2,2, 3);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (3,3, 3);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (3,1, 1);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (3,2, 1);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (4,5, 10);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (4,4, 2);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (5,5, 2);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (6,1, 2);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (7,5, 10);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (7,4, 2);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (7,3, 2);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (7,1, 2);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (8,5, 10);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (8,4, 2);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (9,1, 1);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (10,2, 1);

--adding train schedules---
INSERT INTO trainschedule(train_schedule_id,allocated_capacity, departure_time, reaching_time, city_store_id) VALUES ("M1",50,"10:00:00","13:00:00",1);
INSERT INTO trainschedule(train_schedule_id,allocated_capacity, departure_time, reaching_time, city_store_id) VALUES ("G1",50,"12:00:00","16:00:00",2);
INSERT INTO trainschedule(train_schedule_id,allocated_capacity, departure_time, reaching_time, city_store_id) VALUES ("C1",50,"18:00:00","20:00:00",3);

--adding train trips--
-- INSERT INTO trainTrips(train_schedule_id) VALUES ("M1");
-- INSERT INTO trainTrips(train_schedule_id) VALUES ("G1");

--adding drivers--
INSERT INTO drivers(email,city_store_id) VALUES('driver@gmail.com',1);
INSERT INTO drivers(email,city_store_id) VALUES('dhopinder@gmail.com',1);
INSERT INTO drivers(email,city_store_id) VALUES('terry@gmail.com',1);
INSERT INTO drivers(email,city_store_id) VALUES('hardy@gmail.com',1);
INSERT INTO drivers(email,city_store_id) VALUES('jim@gmail.com',1);

--adding assistant drivers--
INSERT INTO assistantDrivers(email,city_store_id) VALUES('assdriver@gmail.com',1);
INSERT INTO assistantDrivers(email,city_store_id) VALUES('nick@gmail.com',1);
INSERT INTO assistantDrivers(email,city_store_id) VALUES('josh@gmail.com',1);
INSERT INTO assistantDrivers(email,city_store_id) VALUES('cal@gmail.com',1);
INSERT INTO assistantDrivers(email,city_store_id) VALUES('james@gmail.com',1);

--adding trucks--
INSERT INTO trucks(truck_no, truck_owner, city_store_id) VALUES('QL9904','John Kosta',1);
INSERT INTO trucks(truck_no, truck_owner, city_store_id) VALUES('NS1143','John Kosta',1);
INSERT INTO trucks(truck_no, truck_owner, city_store_id) VALUES('US0772','Mareem Baelish',1);
INSERT INTO trucks(truck_no, truck_owner, city_store_id) VALUES('QX5341','Logan Stilinski',1);
INSERT INTO trucks(truck_no, truck_owner, city_store_id) VALUES('MP6020','Rajesh Kapoor',1);
INSERT INTO trucks(truck_no, truck_owner, city_store_id) VALUES('CP2320','Rajesh Kapoor',2);
INSERT INTO trucks(truck_no, truck_owner, city_store_id) VALUES('MR2078','Zayn Malik',3);
INSERT INTO trucks(truck_no, truck_owner, city_store_id) VALUES('JR1543','Fred Andrews',3);



--adding truck schedule---
INSERT INTO truckSchedule(route_no, starting_time, truck_no) VALUES(1,"00:30:00", 'QL9904');
INSERT INTO truckSchedule(route_no, starting_time, truck_no) VALUES(1,"14:00:00", 'NS1143');
INSERT INTO truckSchedule(route_no, starting_time, truck_no) VALUES(1,"18:00:00", 'US0772');
INSERT INTO truckSchedule(route_no, starting_time, truck_no) VALUES(1,"09:00:00", 'US0772');
INSERT INTO truckSchedule(route_no, starting_time, truck_no) VALUES(2,"09:00:00", 'NS1143');
INSERT INTO truckSchedule(route_no, starting_time, truck_no) VALUES(2,"12:00:00", 'QX5341');
INSERT INTO truckSchedule(route_no, starting_time, truck_no) VALUES(2,"22:00:00", 'QX5341');
INSERT INTO truckSchedule(route_no, starting_time, truck_no) VALUES(3,"08:00:00", 'MR2078');
INSERT INTO truckSchedule(route_no, starting_time, truck_no) VALUES(3,"20:00:00", 'JR1543');