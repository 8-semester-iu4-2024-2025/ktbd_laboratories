<html>

<head>
    <meta charset="UTF-8" />
</head>

<body>
    <?php
        require './barcode/fpdf/fpdf.php';
        $conn = oci_connect("system", "oracle_password", "host.docker.internal:1521/FREE");
        if (! $conn) {
            echo("Невозможно подключиться к базе: " . var_dump(oci_error()));
            die();
        }
        $query = "
            SELECT salary
            FROM (SELECT salary, MAX(hire_date) hire_date
            FROM (SELECT hire_date, salary
            FROM (SELECT hire_date, salary
            FROM HR.employees
            ORDER BY hire_date DESC, salary DESC)
            WHERE rownum <= 50)
            GROUP BY salary
            ORDER BY 2 DESC)
            WHERE rownum<20
        ";
        $str = oci_parse($conn, $query);
        oci_execute($str, OCI_DEFAULT);
        $data = [];
        $file = new FPDF();
        $file->AddPage();
        $file->SetFont('Arial', 'B', 16);
        $file->Text(40, 20, 'Salary');
        $margin = 20;
        while (oci_fetch($str)) {
            $margin += 10;
            $file->Text(40, $margin, oci_result($str, 1));
        }
        $file->Output("F", "file.pdf");
        echo " <a href='./file.pdf' download>Скачать файл<br>";
        echo " <a href='./file.pdf'>Открыть файл";
        oci_commit($conn);
        oci_close($conn);
    ?>
</body>

</html>