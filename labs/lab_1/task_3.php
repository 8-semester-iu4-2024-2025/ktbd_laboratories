<form action="task_3.php" method="post">
    Логин: <input type="text" name="login" />
    Пароль: <input type="password" name="password" />
    <input type="submit" value="Войти" name="log_in" />
</form>

<?php
    session_start();

    $conn = oci_connect("system", "admin", "host.docker.internal:1521/xe");
    if (! $conn) {
        echo("Невозможно подключиться к базе: " . var_dump(oci_error()));
        die();
    }

    $str = oci_parse($conn, "SELECT password_hash FROM users WHERE username={$_POST['login']}");
    oci_execute($str, OCI_DEFAULT);

    while (oci_fetch($str)) {
        if (password_verify($_POST['password'], oci_result($str, 1))) {
            $_SESSION['user_id'] = $_POST['login'];
            header('Location: /');
        }
    }
    oci_commit($conn);
    oci_close($conn);

?>