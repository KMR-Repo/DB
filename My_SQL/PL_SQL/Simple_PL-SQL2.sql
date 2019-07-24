/*Cursor with parametrs*/
DECLARE
vName KMR_People.firstname%TYPE;
vCity KMR_People.city%TYPE;
CURSOR kmrcur(nPersonId number) IS
    SELECT firstname, city 
    FROM KMR_People
    WHERE person_id = nPersonId;
BEGIN
    dbms_output.put_line('******************START******************');
    OPEN kmrcur(2);
        LOOP
            FETCH kmrcur INTO vName, vCity;
            EXIT WHEN kmrcur%NOTFOUND;
            dbms_output.put_line('Name:' || vName ||' City:' || vCity);
        END LOOP;
    CLOSE kmrcur;
    dbms_output.put_line('******************$$$$******************');
    OPEN kmrcur(4);
        LOOP
            FETCH kmrcur INTO vName, vCity;
            EXIT WHEN kmrcur%NOTFOUND;
            dbms_output.put_line('Name : ' || vName ||' City : ' || vCity);
        END LOOP;
    CLOSE kmrcur;
    dbms_output.put_line('******************END******************');
END;
/



/*Cursor call within loop*/
DECLARE
rRec KMR_People%ROWTYPE;
nCount number(2);
nRecCount number(2);
CURSOR curTable(nPrId number) IS
    SELECT * 
    FROM KMR_People
    WHERE person_id = nPrId;
BEGIN
dbms_output.put_line(' --------------------------------------');
dbms_output.put_line('|PERSON_ID|FIRSTNAME|LASTNAME|ADDRESS|CITY|');
dbms_output.put_line(' --------------------------------------');
nCount := 1;
SELECT COUNT(person_id) INTO nRecCount
FROM KMR_People;
    LOOP 
        OPEN curTable(nCount);
        LOOP
            FETCH curTable INTO rrec;
            EXIT WHEN curTable%NOTFOUND;
            dbms_output.put_line ('| '||rRec.person_id||' | '||rRec.Lastname||' | '||rRec.Firstname||' | '||rRec.address||' | '||rRec.city||' |');
            dbms_output.put_line(' --------------------------------------');
        END LOOP;
        CLOSE curTable;
    nCount := nCount + 1;
    EXIT WHEN nCount > nRecCount;
    END LOOP;
END;
/

/*PL-SQL with line ***** SIMPLE WAY OF USING CURSOR IN LOOP*/
DECLARE
CURSOR kmrcur IS
    SELECT * 
    FROM KMR_People;
BEGIN
    FOR kmr IN kmrcur LOOP
        dbms_output.put_line ('City :' || kmr.city);
    END LOOP;
END;
/

/*PL-SQL Implicit Exceptions*/
DECLARE
vName KMR_People.Lastname%TYPE;
vCity KMR_People.City%TYPE;
BEGIN
    SELECT lastname, city INTO vName, vCity
    FROM KMR_People
    WHERE person_id = 2;
    dbms_output.put_line('NAME : ' || vName || 'City : '||vCity);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No Data Found');
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Too Many Records');
    WHEN OTHERS THEN
        dbms_output.put_line('Some Other Error');
END;
/

/*String Building in PL-SQL*/
DECLARE
vString varchar2(255) := 'START : ';
CURSOR strcur IS 
    SELECT lastname
    FROM KMR_People;
BEGIN
    FOR each IN strcur
    LOOP
    vString := vString || each.lastname || ' | ';
    END LOOP;
dbms_output.put_line('String : '||vString);
END;
/

/*User defind exception PL-SQL*/
DECLARE
e_kmrException EXCEPTION;
BEGIN
    UPDATE KMR_People
    SET city = 'City Updated'
    WHERE person_id = 5;
    
    IF SQL%NOTFOUND THEN
        RAISE e_kmrException;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No Records Found');
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Too Many Records');
    WHEN e_kmrException THEN
        dbms_output.put_line('Selected record not found');
    WHEN OTHERS THEN
        dbms_output.put_line('Other Issues');
END;
/