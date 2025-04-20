SELECT employee_id
      ,last_name
      ,manager_id
      ,department_id
  FROM hr.employees
 WHERE manager_id IN (
    SELECT manager_id
      FROM hr.employees
     WHERE employee_id IN ( 174
                           ,141 )
)
   AND department_id IN (
    SELECT department_id
      FROM hr.employees
     WHERE employee_id IN ( 174
                           ,141 )
)
   AND employee_id NOT IN ( 174
                           ,141 );

SELECT employee_id
      ,last_name
      ,manager_id
      ,department_id
  FROM hr.employees
 WHERE manager_id = ANY (
    SELECT manager_id
      FROM hr.employees
     WHERE employee_id = ANY ( 174
                              ,141 )
)
   AND department_id = ANY (
    SELECT department_id
      FROM hr.employees
     WHERE employee_id = ANY ( 174
                              ,141 )
)
   AND employee_id <> ALL ( 174
                           ,141 );
/*Для схемы SCOTT определить среднюю зарплату по должностям для каждого из отделов, величина которой превышает 3000; */
SELECT j.job_title
      ,round(avg(e.salary)) AS avg_salary
  FROM hr.employees e
  LEFT JOIN hr.jobs j
ON j.job_id = e.job_id
 GROUP BY j.job_title
HAVING avg_salary > 3000;
/*Для схемы SCOTT определить в каком году в компанию было зачислено наибольшее количество человек? Выдайте этот год и количество зачисленных служащих. */
SELECT EXTRACT(YEAR FROM e.hire_date) AS year
      ,COUNT(*)
  FROM hr.employees e
 GROUP BY year;
/*Найти всех служащих, которые никем не руководят*/
SELECT first_name
      ,last_name
      ,job_title
  FROM hr.employees e
  LEFT JOIN hr.jobs j
ON e.job_id = j.job_id
 WHERE NOT EXISTS (
    SELECT ROWNUM
      FROM hr.employees slave
     WHERE slave.manager_id = e.employee_id
);