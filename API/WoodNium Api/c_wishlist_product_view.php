<?php

include('connect.php');

$user_id = $_GET['user_id'];

if ($user_id=="") {
    echo "User ID required";
}
else {
    
    $query = "SELECT abhay_products.* 
              FROM abhay_wishlist
              JOIN abhay_products 
              ON abhay_wishlist.product_id = abhay_products.id
              WHERE abhay_wishlist.user_id='$user_id'";

    $result = mysqli_query($con, $query);

    $data = array();

    while($row = mysqli_fetch_assoc($result)){
        $data[] = $row;
    }

    echo json_encode($data);
}

?>