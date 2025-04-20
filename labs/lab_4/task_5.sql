INSERT INTO "HR"."EMPLOYEES" (
    employee_id
    ,first_name
    ,last_name
    ,email
    ,phone_number
    ,hire_date
    ,job_id
    ,salary
) VALUES ( 1
          ,'Valentin'
          ,'Kruglov'
          ,'kruglov@mail.ru'
          ,'88005553535'
          ,TO_DATE('2025-0415','YYYY-MM-DD HH24:MI:SS')
          ,1
          ,24000 );
/*Commit Successful*/

SELECT *
  FROM hr.employees
 WHERE employee_id = 1;