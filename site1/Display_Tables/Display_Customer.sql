clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Customer_ID'||'   '||'Customer_Name'||'    '||'customer_phone_number'||'    '||'Customer_Adress'||'      '||'Customer_City'||'      '||'Customer_Zip Code');
    FOR R IN ((SELECT c11.customer_id,  c11.customer_name, c11.customer_phone_number, c21.customer_address, c21.customer_city, c21.customer_zip  FROM CUSTOMER11 C11 JOIN customer12@SITE_LINK C21 ON C11.customer_id = C21.Customer_ID) UNION (SELECT c12.customer_id,  c12.customer_name, c12.customer_phone_number, c22.customer_address, c22.customer_city, c22.customer_zip FROM CUSTOMER21 C12 JOIN customer22@SITE_LINK C22 ON C12.customer_id = C22.Customer_ID)) LOOP
        DBMS_OUTPUT.PUT_LINE(R.customer_id||'   '||R.customer_name||'         '||R.customer_Address||'           '||R.customer_phone_number||'  '||R.customer_city||'  '||R.customer_zip);
    END LOOP;
End;
/
