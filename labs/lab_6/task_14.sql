SPOOL task_14.txt
SELECT decode(
    gm + gj
   ,0
   ,(
        SELECT first_name
               || ' '
               || last_name
          FROM hr.employees
         WHERE employee_id = m.manager_id
    )
   ,1
   ,(
        SELECT lpad(
            first_name
            || ' '
            || last_name
            || 'итоги'
           ,30
           ,'.'
        )
          FROM hr.employees
         WHERE employee_id = m.manager_id
    )
   ,2
   ,lpad(
        'ОБЩИЙ'
       ,25
       ,'.'
    )
) "Руководитель"
      ,decode(
    gm + gj
   ,0
   ,(
        SELECT job_title
          FROM hr.jobs
         WHERE job_id = m.job_id
    )
   ,1
   ,(
        SELECT jobs.job_title
          FROM hr.employees
              ,hr.jobs
         WHERE employee_id = m.manager_id
           AND employees.job_id = jobs.job_id
    )
   ,2
   ,'Итог'
) "Должность"
      ,cnt "Сотрудников"
      ,amount "Сумма"
  FROM (
    SELECT manager_id
          ,job_id
          ,COUNT(*) cnt
          ,SUM(salary *(1 + nvl(
        commission_pct
       ,0
    ))) amount
          ,GROUPING(manager_id) gm
          ,GROUPING(job_id) gj
      FROM hr.employees
     GROUP BY ROLLUP(manager_id
                    ,job_id)
) m;
SPOOL OFF;