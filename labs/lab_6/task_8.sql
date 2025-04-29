-- DROP TABLE emp_selected;
-- CREATE TABLE emp_selected (
--     first_name VARCHAR2(20) NOT NULL
--     ,last_name  VARCHAR2(20) NOT NULL
--     ,n          INTEGER NOT NULL
-- );
-- INSERT INTO emp_selected VALUES ( 'Eilen'
--                                  ,'ABEL'
--                                  ,3 );
-- INSERT INTO emp_selected VALUES ( 'Matthew'
--                                  ,'WEISS'
--                                  ,5 );
-- COMMIT;

SPOOL task_8.txt
SELECT ROW_NUMBER()
       OVER(
     ORDER BY last_name
             ,first_name
       ) "Сквозной #"
      ,ROW_NUMBER()
        OVER(PARTITION BY last_name
                         ,first_name
             ORDER BY last_name
                     ,first_name
) "# в группе"
      ,first_name "Имя"
      ,last_name "Фамилия"
  FROM emp_selected
      ,(
    SELECT level lev
      FROM dual
    CONNECT BY
        level <= 10
)
 WHERE lev <= n
 ORDER BY last_name
         ,first_name;
SPOOL OFF;