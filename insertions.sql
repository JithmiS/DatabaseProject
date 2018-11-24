--adding customers to customers table--
INSERT INTO customers(first_name,last_name,customer_role,email,contact_number,address,password,is_deleted) VALUES('Tony','Stark','end customer','tony@gmail.com','0712345678','London',password(1234),0);
INSERT INTO customers(first_name,last_name,customer_role,email,contact_number,address,password,is_deleted) VALUES('Jake','Peralta','end customer','jake@gmail.com','0712745678','Amsterdam',password(2345),0);
INSERT INTO customers(first_name,last_name,customer_role,email,contact_number,address,password,is_deleted) VALUES('Amy','Sandiago','wholesaler','amy@gmail.com','0713445678','Jaffna',password(2345),0);
INSERT INTO customers(first_name,last_name,customer_role,email,contact_number,address,password,is_deleted) VALUES('Charles','David','retailer','charly@gmail.com','0713476878','Hambanthota',password(78965),0);

--adding city stores--
INSERT INTO citystores(city_name) VALUES ('Matara');
INSERT INTO citystores(city_name) VALUES ('Galle');
INSERT INTO citystores(city_name) VALUES ('Colombo');

--adding products----
INSERT INTO products(product_name, train_capacity_consumption, price) VALUES ('Electric Fan', 5, 2500.00);
INSERT INTO products(product_name, train_capacity_consumption, price) VALUES ('Electric Kettle', 2, 1200.00);
INSERT INTO products(product_name, train_capacity_consumption, price) VALUES ('Microwave Oven', 5, 4500.00);
INSERT INTO products(product_name, train_capacity_consumption, price) VALUES ('Refrigerator', 12, 20000.00);
INSERT INTO products(product_name, train_capacity_consumption, price) VALUES ('Lamp', 1, 500.00);

--adding routes---
INSERT INTO truckRoutes(streets, maximum_time, city_store_id) VALUES ('Matara-Dewundara-Gandara-Dikwella-Tangalle', '01:00:00', 1);
INSERT INTO truckRoutes(streets, maximum_time, city_store_id) VALUES ('Matara-Weligama-Habaraduwa-Ahangama', '01:30:00', 1);

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
INSERT INTO Orders(customer_id,to_building_number,to_street,to_city,route_no) VALUES ('EN002','01/129','Tangalle','Matara',1);

--adding order_products---
INSERT INTO order_product(order_number, product_id, quantity) VALUES (1,1, 3);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (1,2, 1);
INSERT INTO order_product(order_number, product_id, quantity) VALUES (2,2, 3);
