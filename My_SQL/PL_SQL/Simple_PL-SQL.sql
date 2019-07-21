/*Created to practice PL-SQL*/
CREATE TABLE KMR_People ( 
    Person_ID int, 
    LastName varchar(255), 
    FirstName varchar(255), 
    Address varchar(255), 
    City varchar(255)  
) ;

INSERT INTO KMR_People (Person_ID,LastName,FirstName,Address,City) 
VALUES  (1,'L_Name1','F_name1','Add1','City1') ;
INSERT INTO KMR_People (Person_ID,LastName,FirstName,Address,City) 
VALUES  (2,'L_Name2','F_name2','Add2','City2') ;
INSERT INTO KMR_People (Person_ID,LastName,FirstName,Address,City) 
VALUES  (3,'L_Name3','F_name3','Add3','City3') ;
INSERT INTO KMR_People (Person_ID,LastName,FirstName,Address,City) 
VALUES  (4,'L_Name4','F_name4','Add4','City4') ;
INSERT INTO KMR_People (Person_ID,LastName,FirstName,Address,City) 
VALUES  (5,'L_Name5','F_name5','Add5','City5') ;

SELECT * FROM KMR_People ;

/* First PL_SQL */

begin 
   dbms_output.put_line('hello world'); 
end; 

/* Simple PL_SQL with variables*/
DECLARE 
vName varchar(20);
nAge Number(2);
BEGIN
vName   := 'Muthu Ramendiran K';
nAge    := '22';
dbms_output.put_line('Information');
dbms_output.put_line('Name : ' || vName || ' Age : ' || nAge);
END;


/*PL-SQL to retrive data based on sql*/
DECLARE
vName varchar2(10); 
/*If we do not know the datatype of the column we can use following keyword*/
--vName KMR_People.firstname%TYPE
vCity varchar2(5);
BEGIN
SELECT firstname, city INTO vName, vCity
FROM KMR_People
WHERE person_id = '4' ;
dbms_output.put_line('Name :' || vName);
dbms_output.put_line('City :' || vCity);
END;

DECLARE
--vName varchar2(10);
vName KMR_People.firstname%TYPE;
--vCity varchar2(5);
vCity KMR_People.city%TYPE;
vTest vName%TYPE; --we can use like this also
BEGIN
SELECT firstname, city INTO vName, vCity
FROM KMR_People
WHERE person_id = '3' ;
vTest := 'Added For Testing';
dbms_output.put_line('Name :' || vName);
dbms_output.put_line('City :' || vCity);
dbms_output.put_line('Test :' || vTest);
END;


/*PL-SQL to retrive all column in a single variable*/
DECLARE 
vRow KMR_People%ROWTYPE;
BEGIN
SELECT * INTO vRow
FROM KMR_People 
WHERE person_id = 2;
dbms_output.put_line('F_Name : ' || vRow.firstname || ' L_Name : ' || vRow.lastname);
END;

/* Modified Table*/
ALTER TABLE KMR_People
ADD AGE number(2);

SELECT * FROM KMR_People;

UPDATE KMR_People
SET age = '50'
WHERE person_id = 5;

COMMIT;

/*PL_SQL with IF-ELSE condition*/
DECLARE
vRow1 KMR_People%ROWTYPE;
BEGIN
SELECT * INTO vRow1
FROM KMR_People
WHERE person_id = 2;
IF vRow1.age > 20 THEN
    dbms_output.put_line('Age greater than 20');
ELSE
    dbms_output.put_line('Age less than or equal to 20');
END IF;
END;

/*PL-SQL with case codition*/
DECLARE
nPerId KMR_People.person_id%TYPE := 4;
rRow KMR_People%ROWTYPE;
vAge varchar(50);
BEGIN
SELECT * INTO rRow FROM KMR_People
WHERE person_id = nPerId;
vAge := 
    CASE rRow.Age
        WHEN 10 THEN 'Ten Years Old'
        WHEN 20 THEN 'Twenty Years Old'
        WHEN 30 THEN 'Thirty Years Old'
        WHEN 40 THEN 'Fourty Years Old'
        WHEN 50 THEN 'Fifty Years Old'
        Else 'Person may not exist'
    END;
    dbms_output.put_line('Name : ' || rRow.firstname || ' Age : ' || vAge);
END;