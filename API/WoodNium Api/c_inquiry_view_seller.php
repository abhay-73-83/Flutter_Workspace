<?php

include('connect.php');

$seller_id = $_GET['seller_id'];

$query = "SELECT 

    abhay_inquiries.id,
    abhay_inquiries.message,
    abhay_inquiries.status,
    abhay_inquiries.created_at,

    abhay_users.name AS user_name,
    abhay_users.phone,

    abhay_products.name AS product_name,
    abhay_products.price,
    abhay_products.description,
    abhay_products.image

FROM abhay_inquiries

LEFT JOIN abhay_users 
ON abhay_inquiries.user_id = abhay_users.id

LEFT JOIN abhay_products 
ON abhay_inquiries.product_id = abhay_products.id

WHERE abhay_inquiries.seller_id='$seller_id'
ORDER BY abhay_inquiries.id DESC";

$result = mysqli_query($con, $query);

$data = array();

while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}

echo json_encode($data);

?>