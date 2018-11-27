--adding manager--
INSERT INTO managers(first_name, last_name, email, address, contact_number, password, is_deleted) VALUES('Company','Manager','manager@gmail.com','40/5,1st lane,Nawala','0714567234',password(1234),0);

--adding city stores--
INSERT INTO citystores(city_name) VALUES ('Matara');
INSERT INTO citystores(city_name) VALUES ('Galle');
INSERT INTO citystores(city_name) VALUES ('Colombo');

--adding storeManagers--
INSERT INTO storeManagers(first_name, last_name, email, address, contact_number,city_store_id, password, is_deleted) VALUES('matara','storeManager','matarastoremanager@gmail.com','403/2, rahula road, Isadin town, Matara','0715457237',1,password(1234),0);
INSERT INTO storeManagers(first_name, last_name, email, address, contact_number,city_store_id, password, is_deleted) VALUES('galle','galleManager','gallestoremanager@gmail.com','65/6,lighthouse street,galle','0715667209',2,password(1234),0);
INSERT INTO storeManagers(first_name, last_name, email, address, contact_number,city_store_id, password, is_deleted) VALUES('colombo','storeManager','colombostoremanager@gmail.com','3/2,2nd lane, Rawatawatta, Moratuwa','0715667235',3,password(1234),0);

--adding customers to customers table--
INSERT INTO customers(first_name,last_name,customer_role,email,contact_number,address,password,is_deleted) VALUES('Tony','Stark','end customer','tony@gmail.com','0712345678','London',password(1234),0);
INSERT INTO customers(first_name,last_name,customer_role,email,contact_number,address,password,is_deleted) VALUES('Jake','Peralta','end customer','jake@gmail.com','0712745678','Amsterdam',password(2345),0);
INSERT INTO customers(first_name,last_name,customer_role,email,contact_number,address,password,is_deleted) VALUES('Amy','Santiago','wholesaler','amy@gmail.com','0713445678','Jaffna',password(2345),0);
INSERT INTO customers(first_name,last_name,customer_role,email,contact_number,address,password,is_deleted) VALUES('Charles','David','retailer','charly@gmail.com','0713476878','Hambanthota',password(78965),0);

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
INSERT INTO drivers(first_name, last_name, email, address, contact_number,city_store_id, password, is_deleted) VALUES('Company','Driver','driver@gmail.com','32/7,lousy street,Kottawa','0717697234',1,password(1234),0);
INSERT INTO drivers(first_name, last_name, email, address, contact_number,city_store_id, password, is_deleted) VALUES('Dhopinder','Driver','dhopinder@gmail.com','89/9,1st street,galle','0717697890',1,password(1234),0);
INSERT INTO drivers(first_name, last_name, email, address, contact_number,city_store_id, password, is_deleted) VALUES('Terry','Driver','jerry@gmail.com','32/7,new street,Negombo','071723947',1,password(1234),0);
INSERT INTO drivers(first_name, last_name, email, address, contact_number,city_store_id, password, is_deleted) VALUES('Hardy','Driver','hardy@gmail.com','32/7,old street, Ranna','0717697231',1,password(1234),0);
INSERT INTO drivers(first_name, last_name, email, address, contact_number,city_store_id, password, is_deleted) VALUES('Jim','Driver','jim@gmail.com','32/7,flower road, Nuwara','0717697207',1,password(1234),0);

--adding assistant drivers--
INSERT INTO assistantDrivers(first_name, last_name, email, address, contact_number,city_store_id, password, is_deleted) VALUES('Assistant','Driver','assdriver@gmail.com','362/7,anagarika MW, Matara','0717697721',1,password(1234),0);
INSERT INTO assistantDrivers(first_name, last_name, email, address, contact_number,city_store_id, password, is_deleted) VALUES('Nick','Driver','nick@gmail.com','36/1,Queens street, Mahanuwara','0717697732',1,password(1234),0);
INSERT INTO assistantDrivers(first_name, last_name, email, address, contact_number,city_store_id, password, is_deleted) VALUES('Joseph','Driver','josh@gmail.com','362/7,3rd avenue, Panadura','0717697694',1,password(1234),0);
INSERT INTO assistantDrivers(first_name, last_name, email, address, contact_number,city_store_id, password, is_deleted) VALUES('Calvin','Driver','cal@gmail.com','90/9, heavens square, Doncaster','0717697745',1,password(1234),0);
INSERT INTO assistantDrivers(first_name, last_name, email, address, contact_number,city_store_id, password, is_deleted) VALUES('James','Driver','james@gmail.com','43/8, welegoda, Matara','0717697018',1,password(1234),0);

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