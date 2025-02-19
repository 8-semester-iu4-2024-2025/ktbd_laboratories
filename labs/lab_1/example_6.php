<?php
$с = oci_connect("system", "oracle", "//host.docker.internal:1521/xe");
if ($c) {
    echo("Successfully connected to Oracle.\n");
    oci_close($c);
} else {
    $err = oci_error();
    echo("Oracle connected Error " . $err[text]);
}
