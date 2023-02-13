clear screen;
set SERVEROUTPUT on ;
set verify off;

--  add new customer
CREATE OR REPLACE Trigger CustomerInsert11
after insert 
on customer11

BEGIN
    DBMS_OUTPUT.PUT_LINE('New customer added on table 11.');
END;
/
-- CREATE OR REPLACE Trigger CustomerInsert12
-- after insert 
-- on customer12@site_link

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('New customer added on table 12.');
-- END;
-- /
CREATE OR REPLACE Trigger CustomerInsert21
after insert 
on customer21

BEGIN
    DBMS_OUTPUT.PUT_LINE('New customer added on table 21.');
END;
/

-- CREATE OR REPLACE Trigger CustomerInsert22
-- after insert 
-- on customer22@site_link

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('New customer added on table 22.');
-- END;
-- /

--add new car
CREATE OR REPLACE Trigger CarInserted1
after insert 
on car1

BEGIN
    DBMS_OUTPUT.PUT_LINE('New Car added on car table 1.');
END;
/

-- CREATE OR REPLACE Trigger CarInserted2
-- after insert 
-- on car2@site_link

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('New Car added on car table 2.');
-- END;
-- /
--update car table
CREATE OR REPLACE Trigger CarUpdated1
after update 
on car1

BEGIN
    DBMS_OUTPUT.PUT_LINE('car table 1 Updated.');
END;
/

CREATE OR REPLACE Trigger CarUpdated2
after update 
on car2@site_link

BEGIN
    DBMS_OUTPUT.PUT_LINE('car table 2 Updated.');
END;
/

-- assign car to customer
CREATE OR REPLACE Trigger DriverAssigned
after insert 
on rental

BEGIN
    DBMS_OUTPUT.PUT_LINE('Car assigned to customer');
END;
/
