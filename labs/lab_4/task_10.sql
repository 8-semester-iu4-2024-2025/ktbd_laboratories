SELECT country_name
      ,round(avg(salary)) AS n
  FROM hr.countries c
      ,hr.locations l
      ,hr.departments d
      ,hr.employees e
 WHERE c.country_id = l.country_id
   AND l.location_id = d.location_id
   AND e.department_id = d.department_id
 GROUP BY country_name
 ORDER BY n DESC;