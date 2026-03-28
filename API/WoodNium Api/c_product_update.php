<?php

include('connect.php');

$id = $_POST['id'];
$seller_id = $_POST['seller_id'];
$category_id = $_POST['category_id'];
$name = $_POST['name'];
$price = $_POST['price'];
$description = $_POST['description'];
$image = $_POST['image'];

if ($id=="" || $seller_id=="" || $category_id=="" || $name=="" || $price=="" || $description=="" || $image=="") {
    echo "Please Fill All Fields";
}
else {
    $query = "UPDATE abhay_products SET 
              seller_id='$seller_id',
              category_id='$category_id',
              name='$name',
              price='$price',
              description='$description',
              image='$image'
              WHERE id='$id'";

    if(mysqli_query($con,$query)){
        echo "1";
    } else {
        echo "0";
    }
}

?>