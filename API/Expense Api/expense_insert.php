<?php

    include 'connect.php';

    $price = $_POST["amount"];
    $categories = $_POST["category"];
   

    if($price =="" && $categories=="")
    {
        echo "All fields are required.";
    }
    else
    {
        $sql = "INSERT INTO a_tracker (amount, category) VALUES ('$price', '$categories')";
        mysqli_query($con, $sql);
        mysqli_close($con);
    }
?>