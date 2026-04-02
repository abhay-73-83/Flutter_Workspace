<?php

include('connect.php');

$id = $_POST['id'];
$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$password = $_POST['password'];
$shop_name = $_POST['shop_name'];
$pincode = $_POST['pincode'];

if ($id == "" || $name == "" || $email == "" || $phone == "" || $password == "" || $shop_name == "" || $pincode == "") {
    echo "Please Fill All Fields";
}
else {
    $query = "UPDATE abhay_sellers SET 
              name='$name',
              email='$email',
              phone='$phone',
              password='$password',
              shop_name='$shop_name',
              pincode='$pincode'
              WHERE id='$id'";

    $result = mysqli_query($con, $query);

    if($result){
        echo "1";
    } else {
        echo "0";
    }
}

?>