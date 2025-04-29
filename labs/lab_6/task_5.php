<html>

<head>
    <meta charset="utf-8">
</head>

<body>
    <form TARGET="task5.php" METHOD="POST">
        <input type="barcode" name="barcode" placeholder="barcode EAN-13" required /><br>
        <input type="submit" value="submit" />
    </form>
    <?php
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $conn = oci_connect("system", "oracle_password", "host.docker.internal:1521/FREE");
            if (! $conn) {
                echo("Невозможно подключиться к базе: " . var_dump(oci_error()));
                die();
            }

            $query = "
                    INSERT INTO components_storage (
                        comp_storage_id
                    ) VALUES (
                        '" . $_POST['barcode'] . "'
                    )
                ";
            $str = oci_parse($conn, $query);
            oci_execute($str, OCI_DEFAULT);
            oci_commit($conn);
            oci_close($conn);
        }
    ?>

</body>

</html>