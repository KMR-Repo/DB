/*1. Charactor functions*/
/*INFO : Usefull when comparing varchar data types*/
--1.1. UPPER
--1.2. LOWER
--1.3. INITCAP
--1.4. LENGTH
--1.5. CONCAT
--1.6. RPAD, LPAD, SUBSTR
SELECT UPPER('muthu ramendiran k') FROM DUAL;
SELECT LOWER('MUTHU RAMENDIRAN K') FROM DUAL;
SELECT INITCAP('MUTHU RAMENDIRAN K') FROM DUAL;

SELECT OWNER, TABLE_NAME, LENGTH(OWNER) FROM ALL_TABLES
WHERE LENGTH(OWNER) = 5

SELECT CONCAT(OWNER, TABLE_NAME) AS CONCAT FROM ALL_TABLES;

SELECT RPAD(SUBSTR(TABLE_NAME,0,4),8,'$') FROM ALL_TABLES; 

/*2. Number Functions*/
--2.1 MOD
--2.2 ROUND
--2.3 TRUNC
SELECT MOD(10,3) FROM DUAL;
SELECT ROUND(20.38748378, 2) FROM DUAL; 
SELECT TRUNC(20.38748378, 2) FROM DUAL;

/*3. Date Functions*/
--3.1 MONTHS_BETWEEN 
--3.2 NEXT_DAY
--3.3 ADD_MONTH
--3.4 ROUND
--3.5 TRUNC
SELECT ROUND(MONTHS_BETWEEN('01-JUN-2019','05-JAN-2019')) AS MONTHS FROM DUAL;
SELECT NEXT_DAY('11-AUG-2019','MONDAY') FROM DUAL; --returns next occurance of the mentioned day
SELECT ADD_MONTHS(SYSDATE, -1) FROM DUAL;
SELECT 
    ROUND(SYSDATE,'MONTH'), 
    ROUND(TO_DATE('29-AUG-2019'),'MONTH'), 
    ROUND(TO_DATE('10-AUG-2019'),'MONTH'), 
    ROUND(TO_DATE('29-AUG-2019'),'YEAR'),
    ROUND(TO_DATE('29-MAY-2019'),'YEAR'),
    TRUNC(SYSDATE,'MONTH'), 
    TRUNC(TO_DATE('29-AUG-2019'),'MONTH'), 
    TRUNC(TO_DATE('10-AUG-2019'),'MONTH'), 
    TRUNC(TO_DATE('29-AUG-2019'),'YEAR'),
    TRUNC(TO_DATE('29-MAY-2019'),'YEAR')
FROM DUAL;

/*4. Conversion Functions*/
SELECT TO_DATE(TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(SYSDATE, 'MONTH'), 'MM'),'YYYY')) + 10, 'YYYY')FROM DUAL;


/*5. General Functions
NVL : always evaluates both arguments
COALESCE : doesn't evaluate anything after it finds the first non-NULL argument
*/