<?php

    include 'connect.php';

    $a = $_POST["pname"];
    $b = $_POST["pprice"];
    $c = $_POST["pdes"];
   

    if($a=="" && $b=="" && $c=="")
    {
        echo "All fields are required.";
    }
    else
    {
        $sql = "INSERT INTO p_products (pname,pprice,pdes) VALUES ('$a', '$b', '$c')";
        mysqli_query($con, $sql);
        mysqli_close($con);

}




?>