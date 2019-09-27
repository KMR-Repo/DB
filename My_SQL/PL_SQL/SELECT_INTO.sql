/*EXAMPLE*/
DECLARE 
    TYPE RecordTyp IS RECORD (
    V_name VARCHAR2(100),
    V_owner VARCHAR2(100)
    );
    STR RecordTyp;
    --STR2 VARCHAR2(20);
BEGIN
    SELECT OWNER, TABLE_NAME 
    INTO STR
    FROM ALL_TABLES
    WHERE TABLE_NAME = 'SALES';
   dbms_output.put_line(STR.V_name || STR.V_owner);
   
   DBMS_OUTPUT.PUT_LINE('KMR');
END;

SELECT * FROM ALL_TABLES ;

SELECT * FROM HR.EMPLOYEES ;

DECLARE
  TYPE RecordTyp IS RECORD (
    last hr.employees.last_name%TYPE,
    id   hr.employees.employee_id%TYPE
  );
  rec1 RecordTyp;
BEGIN
  SELECT last_name, employee_id INTO rec1
  FROM hr.employees
  WHERE job_id = 'AD_PRES';

  DBMS_OUTPUT.PUT_LINE ('Employee #' || rec1.id || ' = ' || rec1.last);
END;
/