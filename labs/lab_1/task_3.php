<?php
    session_start();
    if (isset($_SESSION['user_id'])) {
        echo("Вы уже вошли как {$_SESSION['user_id']}");
    } else {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $conn = oci_connect("system", "oracle_password", "host.docker.internal:1521/FREEPDB1");
            if (! $conn) {
                die();
            }

            $str = oci_parse($conn, "SELECT password_hash, user_role FROM users WHERE username='{$_POST['login']}'");
            oci_execute($str, OCI_DEFAULT);

            while (oci_fetch($str)) {
                if (password_verify($_POST['password'], oci_result($str, 'password_hash'))) {
                    $_SESSION['user_id']   = $_POST['login'];
                    $_SESSION['user_role'] = oci_result($str, 'USER_ROLE');
                    header('Location: /');
                }
            }

            if (empty($_SESSION['user_id'])) {
                echo("Неверный логин/пароль");
            }

            oci_commit($conn);
            oci_close($conn);
        }
    }
?>

<form action="task_3.php" method="post">
    Логин: <input type="text" name="login" />
    Пароль: <input type="password" name="password" />
    <input type="submit" value="Войти" name="log_in" />
</form>
