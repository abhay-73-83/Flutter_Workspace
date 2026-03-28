<?php

include('connect.php');

$id = $_POST['id'];
$name = $_POST['name'];
$icon = $_POST['icon'];

if ($id == "" || $name == "" || $icon == "") {
    echo "Please Fill All Fields";
}
else {
    $query = "UPDATE abhay_categories 
              SET name='$name', icon='$icon' 
              WHERE id='$id'";
    
    if(mysqli_query($con, $query)){
        echo "1";
    } else {
        echo "0";
    }
}

?>