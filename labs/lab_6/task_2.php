<html>

<head>
    <meta charset="utf-8">
</head>

<body>
    <form TARGET="task2.php" METHOD="POST">
        <input type="text" name="comp_cost" placeholder="cost" required /> <br>
        <input type="text" name="comp_qua" placeholder="count" required /> <br>
        <input type="text" name="comp_type" placeholder="type" required /> <br>
        <input type="text" name="comp_name" placeholder="name" required /> <br>
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
                    INSERT INTO components (
                        comp_cost
                        ,comp_qua
                        ,comp_type
                        ,comp_name
                        ,comp_id
                    ) VALUES (
                    " . $_POST["comp_cost"] . "
                    ," . $_POST["comp_qua"] . "
                    ,'" . $_POST["comp_type"] . "'
                    ,'" . $_POST["comp_name"] . "'
                    ,comp_id_seq.NEXTVAL
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