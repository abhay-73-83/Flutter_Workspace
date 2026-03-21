<?php

include('connect.php');

$email = $_REQUEST['email'];
$password = $_REQUEST['password'];

$sql = "SELECT * FROM abhay_sellers WHERE email='$email' AND password='$password'";
$result = mysqli_query($con, $sql);

if(mysqli_num_rows($result) > 0){
    echo json_encode(['code'=>200]);
} else {
    echo "0";
}

?>