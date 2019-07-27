/*1.1. PL-SQL procedure to with IN OUT parameter*/
CREATE OR REPLACE PROCEDURE Format_number(phone_no IN OUT varchar2) IS
BEGIN
phone_no := '('||SUBSTR(phone_no,1,3)||')'||SUBSTR(phone_no,4,7)||'-'||SUBSTR(phone_no,7);
END;
/

/*1.2.Procedure Call*/
DECLARE 
vNumber varchar2(20);
BEGIN
vNumber := '1234567890';
Format_number(vNumber);
dbms_output.put_line(vnumber);
END;
/

/*2.1.Simple SQL statement without function call*/
SELECT  
    athletes.athlete_name,
    games.year,
    games.city
FROM 
    OLYM.OLYM_ATHLETE_GAMES ath_game, 
    OLYM.OLYM_ATHLETES athletes, 
    OLYM.OLYM_GAMES games
WHERE 
    athletes.id = ath_game.athlete_id
    AND ath_game.game_id = games.id
    AND ROWNUM <=10
ORDER BY athletes.athlete_name DESC;
/

/*2.2.Function in PL-SQL*/
/*  Input : Athlete ID
    Output: Athlete Name*/
CREATE OR REPLACE FUNCTION game_function(ath_id NUMBER) RETURN VARCHAR IS
vAthName OLYM.OLYM_ATHLETES.athlete_name%TYPE;
BEGIN
    SELECT athlete_name INTO vAthName
    FROM olym.olym_athletes
    WHERE id = ath_id;
RETURN vAthName;
END;
/


/*2.3.Simple SQL statement with function call*/
SELECT  
    game_function(ath_game.athlete_id) AS athlete_name,
    ath_game.athlete_id,
    games.year,
    games.city
FROM 
    OLYM.OLYM_ATHLETE_GAMES ath_game,
    OLYM.OLYM_ATHLETES athletes, 
    OLYM.OLYM_GAMES games
WHERE 
    athletes.id = ath_game.athlete_id
    AND ath_game.game_id = games.id
    --AND ROWNUM <=10
ORDER BY athlete_name ;
/


/*Packages in PL-SQL Package: Specification*/
CREATE OR REPLACE PACKAGE olym_games IS
    PROCEDURE olym_atheletes_name(id varchar);
    PROCEDURE olym_game_anem(id varchar);
END;
/

/*3.1.Packages in PL-SQL Package: Specification*/
CREATE OR REPLACE PACKAGE olym_games IS
    PROCEDURE olym_atheletes_name(ath_id varchar);
    PROCEDURE olym_game_name(game_id varchar);
END;
/

/*3.2.Packages in PL-SQL Package : Body*/
CREATE OR REPLACE PACKAGE BODY olym_games IS
    PROCEDURE olym_atheletes_name(ath_id varchar) IS
    vName varchar2(20);
    BEGIN
        SELECT athlete_name INTO vName
        FROM OLYM.OLYM_ATHLETES
        WHERE id = ath_id;
        dbms_output.put_line('ID : '||ath_id||' Name : '||vName);
    END;
    PROCEDURE olym_game_name(game_id varchar) IS
    vGname  varchar2(20);
    BEGIN
    SELECT event INTO vGname
        FROM OLYM.OLYM_BASE_EVENTS
        WHERE id = game_id;
        dbms_output.put_line('ID : '||game_id||' Name : '||vGname);
    END;    
END;
/

/*3.2.Procedure Call*/
EXECUTE olym_games.olym_game_name(1);
EXECUTE olym_games.olym_atheletes_name(1);
/

/*4.1.Bodiless Packages PL-SQL*/
CREATE OR REPLACE PACKAGE global_const IS
    mile2km CONSTANT NUMBER := 1.6093;
    km3mile CONSTANT NUMBER := 0.6214;
END;
/

/*
4.2.Test Bodiless Package
Information :
    dbms_output => Package name
    put_line    => Function Name 
*/
EXECUTE dbms_output.put_line('Mile : '|| 10 || ' KM : ' || 10* global_const.mile2km);

/*5.1.Function Overloading with Packages*/
/*I haven't created package body*/
CREATE OR REPLACE PACKAGE over_loading IS
    PROCEDURE test_something(per_id NUMBER);
    PROCEDURE test_something(per_id VARCHAR);
    PROCEDURE test_something(per_id NUMBER, per_name VARCHAR);
END;
/

/*6.1.Created to test trigger*/
CREATE TABLE KMR_People(
    ID      INT, 
    NAME    VARCHAR2(30));
    
INSERT INTO KMR_People
VALUES(1,'KMR');
INSERT INTO KMR_People
VALUES(2,'MUTHU');

/*6.2.Simple DML-Trigger*/
CREATE OR REPLACE TRIGGER On_Insert
    AFTER INSERT ON KMR_People 
BEGIN
    dbms_output.put_line('One Row Added');
END;
/

/*Custom error message in PL-SQL
ranges from (20,000 - 20,999)*/
BEGIN
Raise_Application_Error(-20348,'KMR_Custom_Error');
END;
/

/*7.1.Created this table to test trigger*/
CREATE TABLE KMR_Product (
ID  INT,
NAME VARCHAR2(10),
PRICE NUMBER(3))

ALTER TABLE KMR_Product 
MODIFY NAME VARCHAR(100);

ALTER TABLE KMR_Product 
MODIFY PRICE NUMBER(20);
   
INSERT INTO KMR_Product 
VALUES (1,'Mac Book Pro', 90000);

INSERT INTO KMR_Product 
VALUES (2,'Mac Book Air', 70000);

INSERT INTO KMR_Product 
VALUES (3,'Mac Book', 65000);

INSERT INTO KMR_Product 
VALUES (4,'Iphone X', 100000);

SELECT * FROM KMR_Product;

/*7.2.Trigger on update in KMR_Product table*/
CREATE OR REPLACE TRIGGER KMR_Product_Trigger 
BEFORE UPDATE OF price ON KMR_Product
FOR EACH ROW
BEGIN
    IF :NEW.price < :OLD.price THEN
        RAISE_APPLICATION_ERROR(-20111,'New Price Less than old price');
        --ROLLBACK;
    END IF;
END;
/*7.3.Update statement to test trigger*/
UPDATE KMR_Product
SET price = 100000
WHERE id = 1;
COMMIT;