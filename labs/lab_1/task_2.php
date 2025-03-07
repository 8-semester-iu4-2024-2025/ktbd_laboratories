<?php
$conn = oci_connect("system", "admin", "host.docker.internal:1521/xe");
if (! $conn) {
    echo("Невозможно подключиться к базе: " . var_dump(oci_error()));
    die();
}
$str = oci_parse($conn, "SELECT sin(3.14), 2+3 FROM dual");
oci_execute($str, OCI_DEFAULT);

while (oci_fetch($str)) {
    echo("sin ( 3.14 ) = " . round(oci_result($str, 1), 5) . "<br>\n");
    echo("2 + 3 = " . oci_result($str, 2) . "<br>\n");
}

oci_commit($conn);
oci_close($conn);
