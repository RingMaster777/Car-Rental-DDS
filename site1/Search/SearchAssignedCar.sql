clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT carModel char PROMPT "Car Model = "

DECLARE
    carModel car1.car_model%TYPE;
    flag  number := 0;
    caid car1.car_id%type;

BEGIN

    carModel := '&carModel';

    FOR R IN ((select * from car1) union (select * from car2@site_link)) LOOP
        if R.car_model = carModel then
            caid := R.car_id;
            -- DBMS_OUTPUT.PUT_LINE(caid); 
            exit;
        else
            caid:=-1;
        End if;
    END LOOP;

    if caid = -1 then
        DBMS_OUTPUT.PUT_LINE('Car model does not exit.');
    else
        
        DBMS_OUTPUT.PUT_LINE('Rent ID'||'   '||'Assigned Car ID'||'    '||'Assigned customer id'||'    '||'Start Date of Rent'||'      '||'End Date of Rent'||'        '||'Status Of Rent');
        FOR R IN (select * from rental) LOOP
        if R.car_id = caid then
            DBMS_OUTPUT.PUT_LINE(R.rental_id||'       '||R.car_id||'         '||R.customer_id||'           '||R.rental_start_date||'  '||R.rental_end_date||'        '|| R.rental_status);            
        End if;
    END LOOP;

    end if;

END;
/

commit;

