SPOOL task_11.txt
SELECT employee_id id
      ,( first_name
          || ' '
          || last_name ) name
  FROM hr.employees
 WHERE employee_id IN ( 194
                       ,195 );
UPDATE hr.employees
   SET
    employee_id = decode(
        employee_id
       ,194
       ,195
       ,195
       ,194
    )
 WHERE employee_id IN ( 194
                       ,195 );
SELECT employee_id id
      ,( first_name
          || ' '
          || last_name ) name
  FROM hr.employees
 WHERE employee_id IN ( 194
                       ,195 );
SPOOL OFF;