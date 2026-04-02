<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

include('connect.php');

$user_id = isset($_REQUEST['user_id']) ? $_REQUEST['user_id'] : '';
$product_id = isset($_REQUEST['product_id']) ? $_REQUEST['product_id'] : '';

if ($user_id == "" || $product_id == "") {
    echo "Please Fill All Fields";
    exit;
}

//Check if already exists
$check = "SELECT * FROM abhay_wishlist 
          WHERE user_id='$user_id' AND product_id='$product_id'";

$result = mysqli_query($con, $check);

//Check query error
if (!$result) {
    die("SELECT ERROR: " . mysqli_error($con));
}

//DELETE
if (mysqli_num_rows($result) > 0) {

    $delete = mysqli_query($con, "DELETE FROM abhay_wishlist 
                                 WHERE user_id='$user_id' AND product_id='$product_id'");

    if (!$delete) {
        die("DELETE ERROR: " . mysqli_error($con));
    }
    echo("delete");

} 
//INSERT
else {

    $insert = mysqli_query($con, "INSERT INTO abhay_wishlist (user_id, product_id) 
                                 VALUES ('$user_id','$product_id')");

    if (!$insert) {
        die("INSERT ERROR: " . mysqli_error($con));
    }
    echo("add");
}

?>