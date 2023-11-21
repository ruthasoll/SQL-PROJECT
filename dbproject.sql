CREATE DATABASE IF NOT EXISTS dbproject;
USE dbproject;

CREATE TABLE IF NOT EXISTS customer (
  customer_id INT NOT NULL,
    customer_name VARCHAR(200),
  customer_DOB date,
  prescription VARCHAR(300),
  phonenumber INT,
  PRIMARY KEY (customer_id));
  
CREATE TABLE IF NOT EXISTS store (
  store_id INT NOT NULL,
  storename varchar(40) NOT NULL,
  location VARCHAR(200) NOT NULL,
  phonenumber INT NOT NULL,
  PRIMARY KEY (store_id));

  
CREATE TABLE IF NOT EXISTS section (
  section_id INT NOT NULL,
  sectionname VARCHAR(200) NOT NULL,
  shelfnumber INT NOT NULL,
  PRIMARY KEY (section_id));
  
CREATE TABLE IF NOT EXISTS employee (
  employee_id INT NOT NULL,
  store_id INT,
  employee_Fname VARCHAR(200) NOT NULL,
  employee_Lname VARCHAR(200) NOT NULL,
  employee_DOB date NOT NULL,
  joindate date not null,
  email VARCHAR(300),
  phonenumber INT NOT NULL,
  salary FLOAT NOT NULL,
  PRIMARY KEY (employee_id),
  foreign key(store_id)
 references store(store_id) on delete set null);
    
    CREATE TABLE IF NOT EXISTS position (
  position_id INT NOT NULL,
   employee_id INT,
  positionname varchar(40),
   positiondescription varchar(40),
  PRIMARY KEY (position_id),
  foreign key(employee_id)
 references employee(employee_id) on delete set null);
 
CREATE TABLE IF NOT EXISTS manufacturer(
  manufacturer_id INT NOT NULL,
  store_id INT,
  manufacturername VARCHAR(200) NOT NULL,
  phonenumber INT ,
  address VARCHAR(200) NOT NULL,
  PRIMARY KEY (manufacturer_id),
  foreign key(store_id)
 references store(store_id) on delete set null);

CREATE TABLE IF NOT EXISTS checkout(
  checkout_id INT NOT NULL,
  employee_id INT,
    cdate date NOT NULL,
 tax INT NOT NULL,
 total FLOAT NOT NULL,
 PRIMARY KEY (checkout_id),
 foreign key(employee_id)
 references employee(employee_id) on delete set null);

CREATE TABLE IF NOT EXISTS item (
  item_id INT NOT NULL,
    itemname VARCHAR(200) NOT NULL,
  itembrand VARCHAR(200) NOT NULL,
  productiondate date NOT NULL,
  expirationdate date NOT NULL,
  quantity INT NOT NULL,
  price FLOAT NOT NULL,
  manufacturer_id INT,
    checkout_id INT,
  customer_id int,
  section_id INT,
   store_id INT,
  PRIMARY KEY (item_id));
   
alter table item add foreign key(store_id)
 REFERENCES store(store_id) on delete set NULL;
 alter table item add foreign key(checkout_id)
 REFERENCES checkout(checkout_id) on delete set NULL;
 alter table item add foreign key(manufacturer_id)
 REFERENCES manufacturer(manufacturer_id) on delete set NULL;
 alter table item add foreign key(section_id)
 REFERENCES section(section_id) on delete set NULL;
 alter table item add foreign key(customer_id)
 REFERENCES customer(customer_id) on delete set NULL;
 
insert into customer values(1,null,20001208,'cough medicine',0926520021);
insert into customer values(2,'abebe',null,'mild painkiller',0911415562);
insert into customer values(3,'feven',19850703,null,0945220001);
insert into customer values(4,null,19790510,'laxative',null);
select *from customer;

insert into store values(1001,'pharmacy','kera branch',0921422262);
insert into store values(1002,'pharmacy','gerji branch',0115895623);
insert into store values(1003,'pharmacy','lebu branch',0115234578);
insert into store values(1004,'pharmacy','semit branch',0952110026);
select *from store;

SELECT item.itemID, Customer.CustomerName, item.itemDate
FROM item
INNER JOIN Customers
ON Orders.CustomerID=Customers.CustomerID;

CREATE VIEW item_checkout
AS SELECT itemname,itembrand,price,tax,total
FROM item,checkout; 
select *from item_checkout;