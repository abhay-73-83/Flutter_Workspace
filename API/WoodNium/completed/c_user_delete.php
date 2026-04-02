<?php

include('connect.php');

$id = $_POST['id'];

if ($id == "") {
    echo "Please Provide ID";
}
else {
    $query = "DELETE FROM abhay_users WHERE id='$id'";
    $result = mysqli_query($con, $query);

    if($result){
        echo "1"; // success
    } else {
        echo "0"; // failed
    }
}
?>