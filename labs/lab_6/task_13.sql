SPOOL task_13.txt
SELECT manager_id "ID менеджера"
      ,job_id "Должность"
      ,COUNT(*) "Число обладателей"
      ,SUM(salary *(1 + nvl(
    commission_pct
   ,0
))) "Выплаты"
  FROM hr.employees
 GROUP BY ROLLUP(manager_id
                ,job_id);

SPOOL OFF;