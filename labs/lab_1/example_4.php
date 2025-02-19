<?php
    echo("<P>");
    echo("name= ");
    echo($_GET["name"]);
    echo("<P>");
    echo("e-mail= ");
    echo($_GET["e-mail"]);
?>

<form action="example_4.php" method="get">
    Name: <input type="text" name="name"><br>
    E-mail: <input type="text" name="e-mail"><br>
    <input type="submit">
</form>
