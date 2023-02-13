CREATE TABLE car2 (
  car_id NUMBER PRIMARY KEY,
  car_model VARCHAR2(50) NOT NULL,
  car_capacity number,
  car_status VARCHAR2(20) NOT NULL,
  price number
);


insert into car2 values (2, 'B1', 15, 'rented',15000);
insert into car2 values (7, 'G1', 15, 'rented',15000);
insert into car2 values (9, 'I1', 15, 'available',15000);
insert into car2 values (4, 'D1', 15, 'available',15000);