DECLARE
    enddate Date;
    curDate Date;
BEGIN
    SELECT sysdate into curDate from dual;
    For R in (SELECT rental_id, rental_end_date,car_id from rental) Loop
        if R.rental_end_date < curDate then 
             FOR P IN (SELECT * FROM car1) LOOP
                IF P.car_id = R.car_id then
                update car1 set car_status = 'available' where car_id = P.car_id;
                exit;
                END IF;
             END LOOP;

             FOR P IN (SELECT * FROM car2@site_link) LOOP
                IF P.car_id = R.car_id then
                update car2@site_link set car_status = 'available' where car_id = P.car_id;
                exit;
                END IF;
             END LOOP;
        end if;
    End loop;
End;

/