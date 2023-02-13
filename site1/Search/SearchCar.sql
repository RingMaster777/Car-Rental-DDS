clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT carModel char PROMPT "Car Model = "

DECLARE
    carModel car1.car_model%TYPE;
    flag  number := 0;

BEGIN

    carModel := '&carModel';

    FOR R IN ((select * from car1) union (select * from car2@site_link)) LOOP
        if R.car_model = carModel then
            DBMS_OUTPUT.PUT_LINE('Car_ID'||'   '||'Car_M0del'||'    '||'Car_Capacity'||'    '||'Car_Price'||'      '||'Car_Status');
            DBMS_OUTPUT.PUT_LINE(R.car_id||'   '||R.car_model||'         '||R.car_capacity||'           '||R.price||'  '||R.car_status);
            exit;
        else
            flag:=1;
            
        End if;
    END LOOP;

    if flag =1 then 
        DBMS_OUTPUT.PUT_LINE('It does not exit');
    end if;
    
END;
/

commit;

