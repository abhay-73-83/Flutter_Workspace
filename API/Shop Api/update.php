<?php

    include 'connect.php';

    $id = $_POST['id'];
    $name = $_POST["pname"];
    $price = $_POST["pprice"];
    $desc = $_POST["pdes"];
 

    $sql = "update p_products set pname='$name', pprice='$price', pdes='$desc' where id = '$id'";
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