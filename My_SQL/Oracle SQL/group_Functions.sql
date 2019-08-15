SELECT * 
FROM ALL_TABLES
WHERE TABLE_NAME LIKE ('%EMP%');

SELECT *
FROM HR.EMPLOYEES;

/*Group Functions*/
SELECT 
    COUNT(EMPLOYEE_ID), 
    SUM(SALARY), 
    MIN(SALARY),
    MAX(SALARY),
    TRUNC(AVG(SALARY))
FROM HR.EMPLOYEES;

/*Having Clause*/
SELECT 
    DEPARTMENT_ID, 
    JOB_ID,
    SUM(SALARY)
FROM 
    HR.EMPLOYEES
GROUP BY 
    DEPARTMENT_ID,
    JOB_ID
HAVING 
    SUM(SALARY) > 10000
ORDER BY 
    SUM(SALARY);
    
/*PLEASE CONSIDER CHECKING
    1. ROLLUP
    2. CUBE
    3. GROUPING
*/
