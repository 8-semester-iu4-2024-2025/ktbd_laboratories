SELECT emp.first_name "Имя"
      ,emp.last_name "Фамилия"
      ,dept.department_name "Отдел"
      ,emp.salary "Оклад"
      ,emp.job_id
      ,d_s.position "Позиция"
  FROM hr.employees emp
      ,hr.departments dept
      ,(
    SELECT ROWNUM position
          ,sal
      FROM (
        SELECT DISTINCT salary sal
          FROM hr.employees
         ORDER BY sal DESC
    )
) d_s
 WHERE d_s.sal = emp.salary
   AND dept.department_id = emp.department_id
   AND d_s.position BETWEEN 2 AND 5
 ORDER BY d_s.position
         ,dept.department_name
         ,job_id;