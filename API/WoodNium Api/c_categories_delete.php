<?php

include('connect.php');

$id = $_POST['id'];

if ($id == "") {
    echo "Please Provide ID";
}
else {
    $query = "DELETE FROM abhay_categories WHERE id='$id'";
    
    if(mysqli_query($con, $query)){
        echo "1";
    } else {
        echo "0";
    }
}

?>