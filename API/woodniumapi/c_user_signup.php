<?php

include('connect.php');

$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$password = $_POST['password'];

if ($name == "" && $email == "" && $phone == "" && $password == "") {
   echo "Please Fill All The Fields";
}
else {
   $query = "insert into users (name,email,phone,password) values('$name','$email','$phone','$password')";
   mysqli_query($con, $query);
}
?>