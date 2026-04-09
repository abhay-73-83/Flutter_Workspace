<?php

include('connect.php');

$product_id = $_GET['product_id'];

$query = "SELECT 
            abhay_product_rating.rating,
            abhay_product_rating.feedback,
            abhay_product_rating.created_at,
            abhay_users.name AS user_name
          FROM abhay_product_rating
          LEFT JOIN abhay_users 
          ON abhay_product_rating.user_id = abhay_users.id
          WHERE abhay_product_rating.product_id='$product_id'
          ORDER BY abhay_product_rating.id DESC";

$result = mysqli_query($con, $query);

$data = array();

while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}

echo json_encode($data);

?>