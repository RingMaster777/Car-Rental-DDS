CREATE TABLE rental (
  rental_id NUMBER PRIMARY KEY,
  car_id NUMBER ,
  customer_id NUMBER ,
  rental_start_date DATE NOT NULL,
  rental_end_date DATE NOT NULL,
  rental_status VARCHAR2(20) NOT NULL
);

insert into rental values (1,  2, 3, '20-jan-23', '20-feb-23', 'UNPAID');
insert into rental values (2,  3, 1, '20-jan-23', '20-feb-23', 'UNPAID');
insert into rental values (3,  5, 2, '10-feb-23', '20-feb-23', 'UNPAID');
insert into rental values (4,  2, 1, '10-feb-23', '11-feb-23', 'UNPAID');


commit;