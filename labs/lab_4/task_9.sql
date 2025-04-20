SELECT last_name
      ,salary
      ,department_id
  FROM hr.employees outer
 WHERE salary > (
    SELECT AVG(salary)
      FROM hr.employees
     WHERE department_id = outer.department_id
);