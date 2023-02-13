clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;


BEGIN
    DBMS_OUTPUT.PUT_LINE('Rent ID'||'   '||'Assigned Car ID'||'    '||'Assigned customer id'||'    '||'Start Date of Rent'||'      '||'End Date of Rent'||'        '||'Status Of Rent');
    FOR R IN (select * from rental) LOOP
        DBMS_OUTPUT.PUT_LINE(R.rental_id||'   '||R.car_id||'         '||R.customer_id||'           '||R.rental_start_date||'  '||R.rental_end_date||'        '|| R.rental_status);
    END LOOP;
END;
/
