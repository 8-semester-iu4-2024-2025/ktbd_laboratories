SELECT employee_id
      ,first_name
      ,last_name
      ,salary
      ,job_id
      ,d_s.position
FROM hr.employees emp
    ,hr.departments dep
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
      AND dep.department_id = emp.department_id
      AND d_s.position BETWEEN 2 AND 5
ORDER BY d_s.position
        ,dep.department_name
        ,job_id;