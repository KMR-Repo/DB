/* Insert multiple values in table*/
CREATE TABLE KMR_PRODUCT(
ID NUMBER CONSTRAINT KMR_PRODUCT_ID_PK PRIMARY KEY,
NAME VARCHAR(10) CONSTRAINT KMR_PRODUCT_NAME_NN NOT NULL);

INSERT INTO KMR_PRODUCT VALUES (&ID, '&NAME');

SELECT * FROM KMR_PRODUCT;

/*Merge staement*/
CREATE TABLE KMR_PRODUCT(
ID NUMBER CONSTRAINT KMR_PRODUCT_ID_PK PRIMARY KEY,
NAME VARCHAR(10) CONSTRAINT KMR_PRODUCT_NAME_NN NOT NULL);


INSERT INTO KMR_PRODUCT
VALUES(1,'PEN');
INSERT INTO KMR_PRODUCT
VALUES(2,'NOTE BOOK');
INSERT INTO KMR_PRODUCT
VALUES(3,'PENCIL');

CREATE TABLE COPY_KMR_PRODUCT(
ID NUMBER CONSTRAINT C_KMR_PRODUCT_ID_PK PRIMARY KEY,
NAME VARCHAR(10) CONSTRAINT C_KMR_PRODUCT_NAME_NN NOT NULL);

MERGE INTO COPY_KMR_PRODUCT COPY
USING KMR_PRODUCT BASE
ON (BASE.ID = COPY.ID)
WHEN MATCHED THEN
    UPDATE SET COPY.NAME = BASE.NAME
WHEN NOT MATCHED THEN
    INSERT VALUES(BASE.ID, BASE.NAME)
    
UPDATE KMR_PRODUCT 
SET NAME = 'PENCIL - 1'
WHERE ID = '3' ;
SELECT * FROM COPY_KMR_PRODUCT;