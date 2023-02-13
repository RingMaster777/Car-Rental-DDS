CREATE TABLE customer12 (
  customer_id NUMBER PRIMARY KEY,
  customer_address VARCHAR2(100) NOT NULL,
  customer_city VARCHAR2(50),
  customer_zip number
);

CREATE TABLE customer22 (
  customer_id NUMBER PRIMARY KEY,
  customer_address VARCHAR2(100) NOT NULL,
  customer_city VARCHAR2(50),
  customer_zip number
);

insert into customer12 values (1,  'MOTIJHEEL', 'DHAKA', 1200);
insert into customer12 values (2,  'NAKHALPARA', 'DHAKA', 1201);
insert into customer12 values (3,  'MOUCHAK', 'DHAKA', 1206);

insert into customer22 values (4,  'BANDAR', 'CHITTAGONG', 1207);
insert into customer22 values (5,  'HALISHAHAR', 'CHITTAGONG', 1205);
insert into customer22 values (6,  'CITYGATE', 'CHITTAGONG', 1209);