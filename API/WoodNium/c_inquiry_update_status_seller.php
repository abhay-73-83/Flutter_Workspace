<?php

include('connect.php');

$id = $_POST['id'];
$status = $_POST['status']; // yes / cancel

if ($id=="" || $status=="") {
    echo "Please Fill All Fields";
}
else {
    $query = "UPDATE abhay_inquiries 
              SET status='$status' 
              WHERE id='$id'";

    if(mysqli_query($con,$query)){
        echo "1";
    } else {
        echo "0";
    }
}

?>