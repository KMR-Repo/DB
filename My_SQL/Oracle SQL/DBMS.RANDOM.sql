CREATE TABLE random_data (
  id           NUMBER,
  small_number NUMBER(5),
  big_number   NUMBER,
  short_string VARCHAR2(50),
  long_string  VARCHAR2(400),
  created_date DATE,
  CONSTRAINT random_data_pk PRIMARY KEY (id)
);

INSERT  INTO random_data
SELECT level AS id,
       TRUNC(DBMS_RANDOM.value(1,5)) AS small_number,
       TRUNC(DBMS_RANDOM.value(100,10000)) AS big_number,
       DBMS_RANDOM.string('L',TRUNC(DBMS_RANDOM.value(10,50))) AS short_string,
       DBMS_RANDOM.string('L',TRUNC(DBMS_RANDOM.value(100,400))) AS long_string,
       TRUNC(SYSDATE + DBMS_RANDOM.value(0,366)) AS created_date
FROM   dual
CONNECT BY level <= 10;

SELECT  ROUND(DBMS_RANDOM.value(1,5), 3) AS small_number, DBMS_RANDOM.string('p',10) AS short_string FROM DUAL;

truncate table random_data;

select * from random_data ;
COMMIT;

link : https://oracle-base.com/articles/misc/dbms_random