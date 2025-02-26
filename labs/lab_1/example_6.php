<?php
$conn = oci_connect("system", "admin", "host.docker.internal:1521/xe");
if (! $conn) {
    $err = oci_error();
    echo("Oracle connected Error " . $err[text]);
} else {
    echo("Successfully connected to Oracle.\n");
    oci_close($conn);
}