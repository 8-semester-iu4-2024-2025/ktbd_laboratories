<?php
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        echo("Мой любимый предмет: <i>" . $_POST['kurs'] . "</i><br>");
        $favorite_times = count($_POST["times"]);
        if ($favorite_times <= 1) {
            $times_message = "не ботан";
        } elseif (($favorite_times > 1) && ($favorite_times < 4)) {
            $times_message = "ботаю иногда";
        } else {
            $times_message = "ботан";
        }
        echo("я <i>" . $times_message . "<i><br>");
    }
?>

<FORM TARGET="example_5.php" METHOD="POST">
    Любимый предмет:<br>
    <INPUT TYPE=RADIO NAME="kurs" VALUE="КТБД">Конструкторско-технологические базы данных<br>
    <INPUT TYPE=RADIO NAME="kurs" VALUE="СФМ">Системы функционального моделирования<br>
    <INPUT TYPE=RADIO NAME="kurs" VALUE="СИИ">Системы искусственного интеллекта<br>

    когда вы предпочитаете его изучать:<br>
    <INPUT TYPE=CHECKBOX NAME="times[]" VALUE="m">за завтраком
    <INPUT TYPE=CHECKBOX NAME="times[]" VALUE="n">в обед
    <INPUT TYPE=CHECKBOX NAME="times[]" VALUE="d">за ужином
    <INPUT TYPE=CHECKBOX NAME="times[]" VALUE="l">поздно ночью

    <P>
        <INPUT TYPE="HIDDEN" NAME="stage" VALUE="results">
        <INPUT TYPE="SUBMIT" VALUE="Всегда!">
</FORM>
