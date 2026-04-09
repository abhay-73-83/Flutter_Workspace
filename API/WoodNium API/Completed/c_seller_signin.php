<?php

include('connect.php');

// ✅ Get data
$email = $_POST['email'];
$password = $_POST['password'];

// ✅ Query
$sql = "SELECT * FROM abhay_sellers WHERE email='$email' AND password='$password'";
$result = mysqli_query($con, $sql);

if(mysqli_num_rows($result) > 0)
{
    $seller = mysqli_fetch_assoc($result);

    // ✅ Return full user data
    echo json_encode([
        "status" => 1,
        "message" => "Login Success",
        "data" => [
            "id" => $seller['id'],
            "name" => $seller['name'],
            "email" => $seller['email'],
            "phone" => $seller['phone'],
            "password" => $seller['password'],
            "shop_name" => $seller['shop_name'],
            "pincode" => $seller['pincode'],
        ]
    ]);
}
else
{
    echo json_encode([
        "status" => 0,
        "message" => "Invalid Email or Password"
    ]);
}
?>
