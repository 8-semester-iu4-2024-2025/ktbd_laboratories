SELECT ROW_NUMBER()
       OVER(
     ORDER BY department_id
       ) "Сквозной №"
      ,ROW_NUMBER()
        OVER(PARTITION BY department_id
             ORDER BY salary DESC
) "№ внутри отдела"
      ,department_id "# отд."
      ,job_id "Должность"
      ,last_name "Фамилия"
      ,salary "Зарплата"
      ,RANK()
        OVER(PARTITION BY department_id
             ORDER BY salary DESC
        ) "Ранг в отделе"
  FROM hr.employees
 WHERE department_id IN ( 10
                         ,30
                         ,50
                         ,90 );