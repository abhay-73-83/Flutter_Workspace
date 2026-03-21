<?php

include('connect.php');

$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$password = $_POST['password'];
$shop_name = $_POST['shop_name'];
$pincode = $_POST['pincode'];

if ($name == "" || $email == "" || $phone == "" || $password == "" || $shop_name == "" || $pincode == "") {
    echo "Please Fill All Fields";
}
else {
    $query = "insert into abhay_sellers (name,email,phone,password,shop_name,pincode) values('$name','$email','$phone','$password','$shop_name','$pincode')";

    $result = mysqli_query($con, $query);

    if($result){
        echo "1";
    } else {
        echo "0";
    }
}

?>