<html>

<head>
    <meta charset="utf-8">
</head>

<body>
    <form action="" target="task_4.php" method="POST" enctype="multipart/form-data">
        <input type="file" name="file" required /> <br>
        <input type="submit" value="submit" />
    </form>
    <?
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $conn = oci_connect("system", "oracle_password", "host.docker.internal:1521/FREE");
            if (! $conn) {
                echo("Невозможно подключиться к базе: " . var_dump(oci_error()));
                die();
            }

            if (($handle = fopen($_files['file']['tmp_name'], 'r')) !== false) {
                $query = "BEGIN";
                while (($data = fgetcsv($handle, 1000, ",")) !== false) {
                    $query .= "
                        INSERT INTO components (
                            comp_cost
                            ,comp_qua
                            ,comp_type
                            ,comp_name
                            ,comp_id
                        ) VALUES (
                        " . $data[0] . "
                        ," . $data[1] . "
                        ,'" . $data[2] . "'
                        ,'" . $data[3] . "'
                        ,comp_id_seq.NEXTVAL
                        );
                    ";
                }
                $query .= "END;";
                fclose($handle);
                $str = oci_parse($conn, $query);
                oci_execute($str, OCI_DEFAULT);
                oci_commit($conn);
                oci_close($conn);
            }
        }
    ?>
</body>

</html>