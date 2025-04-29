SPOOL task6.txt
COL "Фамилия" FORMAT A5
COL "Подчинение" FORMAT A30
SELECT lpad(
    last_name
   ,length(last_name) + 2 *(level - 1)
   ,'.'
) "Фамилия"
      ,sys_connect_by_path(
    last_name
   ,'/'
) "Подчинение"
  FROM hr.employees
CONNECT BY
    PRIOR employee_id = manager_id
START WITH employee_id = 101
 ORDER SIBLINGS BY last_name;
SPOOL OFF;