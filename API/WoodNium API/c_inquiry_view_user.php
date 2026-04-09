<?php

include('connect.php');

$user_id = $_GET['user_id'];

$query = "SELECT 
            abhay_inquiries.*,
            abhay_products.name AS product_name,
            abhay_products.price,
            abhay_products.image
          FROM abhay_inquiries
          LEFT JOIN abhay_products 
          ON abhay_inquiries.product_id = abhay_products.id
          WHERE abhay_inquiries.user_id='$user_id'
          ORDER BY abhay_inquiries.id DESC";

$result = mysqli_query($con, $query);

$data = array();

while($row = mysqli_fetch_assoc($result)){

    if($row['status']=="yes"){
        $row['status_text']="Complete";
    } elseif($row['status']=="cancel"){
        $row['status_text']="N/A";
    } else {
        $row['status_text']="Pending";
    }

    $data[] = $row;
}

echo json_encode($data);

?>