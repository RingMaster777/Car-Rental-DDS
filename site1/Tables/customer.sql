CREATE TABLE customer11 (
  customer_id NUMBER PRIMARY KEY,
  customer_name VARCHAR2(50) NOT NULL,
  customer_phone_number VARCHAR2(15) NOT NULL
);

CREATE TABLE customer21 (
  customer_id NUMBER PRIMARY KEY,
  customer_name VARCHAR2(50) NOT NULL,
  customer_phone_number VARCHAR2(15) NOT NULL
);

insert into customer11 values (1, 'ABIR', '123456');
insert into customer11 values (2, 'RAFI', '123434');
insert into customer11 values (3, 'ALFY', '123232');

insert into customer21 values (4, 'RIFA', '123656');
insert into customer21 values (5, 'SAFIYA', '121434');
insert into customer21 values (6, 'FARIYA', '323123');

commit;