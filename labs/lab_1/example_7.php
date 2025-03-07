<?php
$conn = oci_connect("system", "admin", "host.docker.internal:1521/xe");
if (! $conn) {
    echo("Невозможно подключиться к базе: " . var_dump(oci_error()));
    die();
}
$str = oci_parse($conn, "SELECT object_name, object_type FROM user_objects");
oci_execute($str, OCI_DEFAULT);

echo("<center><table border=1>
    <tr>
    <td><center>OBJECT_NAME</center></td>
    <td><center>OBJECT_TYPE</center></td>
    </tr>");
while (oci_fetch($str)) {
    echo("<tr><td>" . oci_result($str, "OBJECT_NAME") . "</td><td>" . oci_result($str, "OBJECT_TYPE") . "</td></tr>");
}

echo("</table></center>");
oci_commit($conn);
oci_close($conn);
