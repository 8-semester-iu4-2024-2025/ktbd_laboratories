<html>

<head>
    <meta charset="utf-8">
</head>

<body>
    <?php
        $conn = oci_connect("system", "oracle_password", "host.docker.internal:1521/FREE");
        if (! $conn) {
            echo("Невозможно подключиться к базе: " . var_dump(oci_error()));
            die();
        }
        $query = "
                    SELECT e1.last_name
                        ,e1.salary
                        ,e2.last_name
                        ,e2.salary
                        ,e1.department_id
                        ,g.avsal
                    FROM hr.employees e1
                        ,hr.employees e2
                        ,(
                        SELECT department_id
                            ,round(avg(salary)) avsal
                        FROM hr.employees
                        GROUP BY department_id
                    ) g
                    WHERE e1.department_id = e2.department_id
                    AND e1.department_id = g.department_id
                    AND e1.salary > g.avsal
                    AND e1.salary < e2.salary
                    AND e2.employee_id <> e1.employee_id
                    AND e1.department_id IN ( 60
                                             ,80 )
                    ORDER BY e1.department_id
                            ,e1.salary
                            ,e1.last_name
                            ,e2.salary
                            ,e2.last_name
                ";
        $str = oci_parse($conn, $query);
        oci_execute($str, OCI_DEFAULT);
    ?>
    <center>
        <table border=1>
            <tr>
                <td>Фамилия</td>
                <td>Оклад</td>
                <td>Фамилия</td>
                <td>Оклад</td>
                <td>Отдел</td>
                <td>Средний оклад</td>
            </tr>
            <?php
                while (oci_fetch($str)) {
                    echo("<tr>");
                    echo("<td>" . oci_result($str, 1) . "</td>");
                    echo("<td>" . oci_result($str, 2) . "</td>");
                    echo("<td>" . oci_result($str, 3) . "</td>");
                    echo("<td>" . oci_result($str, 4) . "</td>");
                    echo("<td>" . oci_result($str, 5) . "</td>");
                    echo("<td>" . oci_result($str, 6) . "</td>");
                    echo("</tr>");
                }
            ?>
        </table>
    </center>
    <?php
        oci_commit($conn);
        oci_close($conn);
    ?>
</body>

</html>


<!-- SELECT department_id
      ,round(avg(salary)) avsal
  FROM hr.employees
 GROUP BY department_id;
 select * from hr.employees where salary > 5760 and department_id = 60; -->