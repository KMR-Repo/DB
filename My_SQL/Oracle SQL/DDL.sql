CREATE TABLE KMR_People(
Id int,
Name varchar2(200));

SELECT * FROM all_tables
WHERE table_name = 'KMR_PEOPLE';
--ORDER BY last_analyzed DESC;


SHOW USER;

/*1.DDL create table*/
CREATE TABLE KMR_Employees(
Emp_ID      NUMBER,
FirstName   VARCHAR(30),
LastName    VARCHAR(30),
Email_Id    VARCHAR(50),
Mobile_No   NUMBER(10),
Gender      CHAR(1),
Dept_Id     INT,
DOJ         DATE DEFAULT SYSDATE);

SELECT * FROM KMR_Employees;

INSERT INTO KMR_Employees(Emp_ID,FirstName,LastName,Email_Id,Mobile_No,Gender,Dept_Id)
VALUES (1,'Muthu','Ramendiran','kmr@gmail.com','9087654321','M',100);

/*2.DDL Alter Table */
/*2.1.Add Column*/
ALTER TABLE KMR_Employees
ADD DOB DATE;

SELECT * FROM KMR_Employees
WHERE DOB IS NULL;
/*2.1.1.Add multiple columns*/
ALTER TABLE KMR_Employees
ADD (Salary NUMBER(12,2),Job_Title VARCHAR2(30) DEFAULT 'Engineer');

/*2.2.Modify data type of column*/
ALTER TABLE KMR_Employees
MODIFY Salary NUMBER(15,2);

/*2.3.1.Droping column*/
ALTER TABLE KMR_Employees
DROP COLUMN DOB;

SELECT * FROM KMR_Employees
WHERE DOB IS NULL;
ALTER TABLE KMR_Employees
ADD DOB DATE;

/*2.3.2.SET unused*/
ALTER TABLE KMR_Employees
SET UNUSED COLUMN DOB;

/*2.3.2.1 Delete Unused Columns*/
ALTER TABLE KMR_Employees
DROP UNUSED COLUMNS;

/*2.4 Rename Column name*/
ALTER TABLE KMR_Employees
RENAME COLUMN DOJ TO DateOfJoining;

/*3.DDL- Drop Table*/
CREATE TABLE TABLE_TO_DROP(
ID NUMBER,
SOMETHING VARCHAR2(10));

INSERT INTO TABLE_TO_DROP
VALUES(1,'SOME_DATA');

SELECT * FROM TABLE_TO_DROP;

DROP TABLE TABLE_TO_DROP;

/********End of drop**********/


/*4.DDL - Truncate Table*/
/*Information: truncate statement
classified as DDL command
--becase rollback is not possible 
--becase it releases memory also
--change in meta data */
CREATE TABLE TABLE_TO_TRUNCATE(
ID NUMBER,
SOMETHING VARCHAR2(10));

INSERT INTO TABLE_TO_TRUNCATE
VALUES(1,'SOME_DATA');

SELECT * FROM TABLE_TO_TRUNCATE
WHERE ROWNUM = 1;

TRUNCATE TABLE TABLE_TO_TRUNCATE;

/*Since the table truncated only the data is deleted not table structure*/
INSERT INTO TABLE_TO_TRUNCATE
VALUES(2,'SOME_DATA2');