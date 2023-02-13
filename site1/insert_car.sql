clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT carModel char PROMPT "Car Model = "
ACCEPT carCapacity number PROMPT "Car Capacity = "
ACCEPT carStatus char PROMPT "Availability = "
ACCEPT PRIC number PROMPT "Rent Price = "

DECLARE
    carID car1.car_id%TYPE;
    carModel car1.car_model%TYPE;
    carCapacity car1.car_capacity%TYPE;
    carStatus car1.car_status%TYPE;
    price NUMBER;
    userDefException EXCEPTION;

    ex number;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Add New Car:');
    carModel := '&carModel';
    carCapacity := &carCapacity;
    carStatus := '&carStatus';
    price := &PRIC;

    ex := CustomerCheck.FindCar(carModel);

    if ex = 1 then
        raise userDefException;
    else
        select count(car_id) into carID from (select car_id from car1 union select car_id from car2@site_link);
        if carCapacity = 10 then
            insert into car1 values (carID+1,carModel,carCapacity,carStatus,price);
        else
            insert into car2@site_link values (carID+1,carModel,carCapacity,carStatus,price);
        end if;
    End if;

    EXCEPTION
        WHEN userDefException THEN
            DBMS_OUTPUT.PUT_LINE('Car already Exist');
    
END;
/

commit;

