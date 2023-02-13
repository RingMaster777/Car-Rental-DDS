clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Car_ID'||'   '||'Car_M0del'||'    '||'Car_Capacity'||'    '||'Car_Price'||'      '||'Car_Status');
    FOR R IN ((select * from car1) union (select * from car2@site_link)) LOOP
        DBMS_OUTPUT.PUT_LINE(R.car_id||'   '||R.car_model||'         '||R.car_capacity||'           '||R.price||'  '||R.car_status);
    END LOOP;
END;
/
