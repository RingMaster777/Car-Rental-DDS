clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE PROCEDURE assignCar(capacity IN number,cID IN number,startDate IN Date, endDate IN Date, rentStatus IN VARCHAR2)
IS
    rentalID number;
    flag number;
    carID number;
BEGIN
    flag := 1;
    if capacity = 10 then
        FOR R IN (SELECT * FROM car1) LOOP
            IF R.car_status = 'available' then
                carID := R.car_id;
                flag := 0;
                exit;
            END IF;
        END LOOP;
    else
        FOR R IN (SELECT * FROM car2@site_link) LOOP
            IF R.car_status = 'available' then
                carID := R.car_id;
                flag := 0;
                exit;
            END IF;
        END LOOP;
    end if;
    
    IF flag = 0 then
        SELECT count(rental_id) into rentalID FROM rental;
        insert into rental values(rentalID+1,carID,cID, startDate, endDate,rentStatus);



        For K in (select car_id from car1) LOOP
            if K.car_id = carID then
                update car1 set car_status = 'rented' where car_id = carID;
                exit;
            end if;
        END LOOP;


        For K in (select car_id from car2@site_link) LOOP
            if K.car_id = carID then
                update car2@site_link set car_status = 'rented' where car_id = carID;
                exit;
            end if;
        END LOOP;
        
    ELSE
        DBMS_OUTPUT.PUT_LINE('Sorry Buddy, No Car available for you!');
    END IF;

END assignCar;
/

ACCEPT capacity NUMBER PROMPT "Car Capacity = ";
ACCEPT cID NUMBER PROMPT "Customer ID = ";
ACCEPT startDate Date PROMPT "Start Date = ";
ACCEPT endDate Date PROMPT "End Date = ";
ACCEPT rentStatus char PROMPT "Rental Status = ";

DECLARE
    cID number;
    capacity number;
    startDate date;
    endDate date;
    rentStatus VARCHAR2(20);
BEGIN
    cID  := '&CID';
    capacity := '&capacity';
    startDate := '&startDate';
    endDate := '&endDate';
    rentStatus := '&rentStatus';

    assignCar(capacity,cID,startDate,endDate,rentStatus);
END;
/

commit;