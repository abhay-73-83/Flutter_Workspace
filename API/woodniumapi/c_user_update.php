<?php

include('connect.php');

$id = $_POST['id'];
$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$password = $_POST['password'];

if ($id == "" || $name == "" || $email == "" || $phone == "" || $password == "") {
    echo "Please Fill All Fields";
}
else {
    $query = "UPDATE abhay_users SET 
              name='$name',
              email='$email',
              phone='$phone',
              password='$password'
              WHERE id='$id'";

    $result = mysqli_query($con, $query);

    if($result){
        echo "1"; // success
    } else {
        echo "0"; // failed
    }
}

?>