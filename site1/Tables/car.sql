CREATE TABLE car1 (
  car_id NUMBER PRIMARY KEY,
  car_model VARCHAR2(50) NOT NULL,
  car_capacity number,
  car_status VARCHAR2(20) NOT NULL,
  price number
);

insert into car1 values (1, 'A1', 10, 'available',12000);
insert into car1 values (6, 'F1', 10, 'available',12000);
insert into car1 values (3, 'C1', 10, 'available',12000);
insert into car1 values (8, 'H1', 10, 'available',12000);
insert into car1 values (5, 'E1', 10, 'rented',12000);
insert into car1 values (10, 'J1', 10, 'rented',12000);

commit;