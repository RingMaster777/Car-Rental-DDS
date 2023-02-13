SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT customerName char PROMPT "Customer Name = "
ACCEPT customerPhoneNumber char PROMPT "customer phone number = "
ACCEPT customerAddress char PROMPT "customer address = "
ACCEPT customerCity char PROMPT "customer city = "
ACCEPT customerZip number PROMPT "customer zip = "

DECLARE
    customerName customer11.customer_name%TYPE := '&customerName';
    customerPhoneNumber customer11.customer_phone_number%TYPE := '&customerPhoneNumber';
    customerAddress VARCHAR2(100) := '&customerAddress';
    customerCity VARCHAR2(50) := '&customerCity';
    customerZip number := &customerZip;
    customerId customer11.customer_id%TYPE;
    ex number;

    userDefException exception;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Add Customer :');

    ex := CustomerCheck.FindCustomer(customerPhoneNumber);
    if ex = 1 then
        raise userDefException;
    Else
        select count(customer_id) into customerId from (SELECT c11.customer_id FROM CUSTOMER11 C11 JOIN customer12@SITE_LINK C21 ON C11.customer_id = C21.Customer_ID UNION SELECT c12.customer_id FROM CUSTOMER21 C12 JOIN customer22@SITE_LINK C22 ON C12.customer_id = C22.Customer_ID);
        if customerCity = 'DHAKA' then
            insert into customer11 values(customerId+1,customerName,customerPhoneNumber);
            insert into customer12@site_link values(customerId+1,customerAddress,customerCity,customerZip);
        else
            insert into customer21 values(customerId+1,customerName,customerPhoneNumber);
            insert into customer22@site_link values(customerId+1,customerAddress,customerCity,customerZip); 
        end if;

    End if;

    EXCEPTION
        WHEN userDefException THEN
            DBMS_OUTPUT.PUT_LINE('Customer already Registered');
END;
/
commit;

