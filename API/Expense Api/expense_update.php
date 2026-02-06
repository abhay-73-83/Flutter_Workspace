<?php

    include 'connect.php';

    $id = $_POST['id'];
    $price = $_POST["amount"];
    $categories = $_POST["category"];

    $sql = "update a_tracker set amount='$price', category='$categories' where id = '$id'";
    if(mysqli_query($con, $sql))
    {
        echo "Record updated successfully";
    }
    else
    {
        echo "Error updated record: " . mysqli_error($con);
    }
   
    mysqli_close($con);
?>