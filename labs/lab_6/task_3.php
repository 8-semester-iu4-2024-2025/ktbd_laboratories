<html>

<head>
    <meta charset="utf-8">
</head>

<body>

    <form TARGET="task_3.php" METHOD="POST">
        <input type="login" name="login" placeholder="login" required /> <br>
        <input type="password" name="password" placeholder="password" required /> <br>
        <input type="submit" value="submit" />
    </form>
    <?
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $conn = oci_connect("system", "oracle_password", "host.docker.internal:1521/FREE");
            if (! $conn) {
                echo("Невозможно подключиться к базе: " . var_dump(oci_error()));
                die();
            }
            $query = "
            SELECT * FROM users WHERE LOGIN = '" . $_POST['login'] . "' AND PASSWORD = '" . $_POST['password'] . "'
            ";
            $str = oci_parse($conn, $query);
            oci_execute($str, OCI_DEFAULT);
            $row = oci_fetch($str);
            if (oci_num_rows($str) >= 1) {
                echo("Пользователь найден");
            } else {
                echo("Пользователь не найден");
            }

            oci_commit($conn);
            oci_close($conn);
        }
    ?>
</body>

</html>