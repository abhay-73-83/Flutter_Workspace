<?php
include('connect.php');

// ✅ Get data
$email = $_POST['email'];
$password = $_POST['password'];

// ✅ Query
$sql = "SELECT * FROM abhay_users WHERE email='$email' AND password='$password'";
$result = mysqli_query($con, $sql);

if(mysqli_num_rows($result) > 0)
{
    $user = mysqli_fetch_assoc($result);

    // ✅ Return full user data
    echo json_encode([
        "status" => 1,
        "message" => "Login Success",
        "data" => [
            "id" => $user['id'],
            "name" => $user['name'],
            "email" => $user['email'],
            "phone" => $user['phone'],
            "password" => $user['password']
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