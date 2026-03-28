<?php

include('connect.php');

$name = $_POST['name'];
$icon = $_POST['icon'];

if ($name == "" || $icon == "") {
    echo "Please Fill All Fields";
}
else {
    $query = "INSERT INTO abhay_categories (name, icon) VALUES ('$name','$icon')";
    
    if(mysqli_query($con, $query)){
        echo "1";
    } else {
        echo "0";
    }
}

?>