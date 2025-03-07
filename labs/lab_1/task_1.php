<!DOCTYPE>
<html>

<body>
    <?php
        $countriesWithCities = [
            "Japan"       => "Tokyo",
            "Mexico"      => "Mexico City",
            "USA"         => "Washington",
            "India"       => "Mumbai",
            "South Korea" => "Seoul",
            "China"       => "Shanghai",
            "Nigeria"     => "Lagos",
            "Brazil"      => "Sao Paulo",
            "Egypt"       => "Cairo",
            "England"     => "London",
        ];
    ?>
    <form action="task_1.php" method="POST">
        <h3>Please choose a country from the list box. </h3>
        <select name="city" id="listBox">
            <?php foreach ($countriesWithCities as $individualCountry => $city) {?>
            <option value=<?php echo($city); ?>><?php echo($individualCountry); ?></option>
            <?php }?>
        </select>
        <input type="submit" name="submitButton" id="submitButton" value="Submit form" />
    </form>

    <?php if (isset($_POST["submitButton"])) {
            echo "You chose " . $_POST['city'];
        }
    ?>
</body>

</html>
