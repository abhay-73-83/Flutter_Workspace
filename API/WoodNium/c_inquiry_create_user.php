<?php

include('connect.php');

$user_id = $_POST['user_id'];
$product_id = $_POST['product_id'];
$message = $_POST['message'];

if ($user_id=="" || $product_id=="" || $message=="") {
    echo "Please Fill All Fields";
}
else {

    // get seller_id from product
    $res = mysqli_query($con, "SELECT seller_id FROM abhay_products WHERE id='$product_id'");
    $row = mysqli_fetch_assoc($res);

    if(!$row){
        echo "Invalid Product";
        exit;
    }

    $seller_id = $row['seller_id'];

    $query = "INSERT INTO abhay_inquiries (user_id,product_id,seller_id,message)
              VALUES ('$user_id','$product_id','$seller_id','$message')";

    if(mysqli_query($con,$query)){
        echo "1";
    } else {
        echo "0";
    }
}

?>