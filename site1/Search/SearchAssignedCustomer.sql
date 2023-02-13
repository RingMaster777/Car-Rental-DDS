clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT customerPhone char PROMPT "Customer Phone = "

DECLARE
    cPhone customer.customer_phone_number%TYPE;
    flag  number := 0;
    cusID customer11.customer_id%type;

BEGIN

    cPhone := '&customerPhone';
    FOR R IN ((SELECT c11.Customer_ID, c11.customer_phone_number FROM CUSTOMER11 C11 JOIN customer12@SITE_LINK C21 ON C11.customer_id = C21.Customer_ID) UNION (SELECT c12.Customer_ID, c12.customer_phone_number FROM CUSTOMER21 C12 JOIN customer22@SITE_LINK C22 ON C12.customer_id = C22.Customer_ID)) LOOP
        if R.customer_phone_number = cPhone then
            cusID := R.customer_id;
            exit;
        else
            cusID := -1;
        End if;
    END LOOP;

   

    if cusID = -1 then
        DBMS_OUTPUT.PUT_LINE('Customer does not exit.');
    else
        
        DBMS_OUTPUT.PUT_LINE('Customer_ID'||'   '||'Customer_Name'||||'customer_phone_number'||'    '||'Customer_Adress'||'      '||'Customer_City'||'      '||'Customer_Zip Code');
        FOR R IN (select * from rental) LOOP
            if R.Customer_ID = cusID then
               DBMS_OUTPUT.PUT_LINE(R.customer_id||'   '||R.customer_name||'         '||R.customer_Address||'           '||R.customer_phone_number||'  '||R.customer_city||'  '||R.customer_zip);            
            End if;
        END LOOP;

    end if;

END;
/

commit;

