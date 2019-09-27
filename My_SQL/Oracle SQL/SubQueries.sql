/*Sub Queries*/
/*1.Returing single row*/
SELECT FIRST_NAME, LAST_NAME FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID = (
SELECT EMPLOYEE_ID
FROM HR.EMPLOYEES
WHERE SALARY > (
SELECT SALARY 
FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID = 101));

/*Returing multiple row*/
SELECT * FROM HR.EMPLOYEES
WHERE SALARY > ALL--ANY (1.ANY, 2.ALL)
( SELECT SALARY
FROM HR.EMPLOYEES
WHERE FIRST_NAME = 'John');

/*Sequence*/
SELECT * FROM USER_SEQUENCE;

CREATE SEQUENCE customers_seq
 START WITH     1000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 /*Index*/
 /*Synonym*/