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