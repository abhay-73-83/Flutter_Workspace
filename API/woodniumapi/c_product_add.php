<?php

include('connect.php');

$seller_id = $_POST['seller_id'];
$category_id = $_POST['category_id'];
$name = $_POST['name'];
$price = $_POST['price'];
$description = $_POST['description'];
$image = $_POST['image'];

if ($seller_id=="" || $category_id=="" || $name=="" || $price=="" || $description=="" || $image=="") {
    echo "Please Fill All Fields";
}
else {
    $query = "INSERT INTO abhay_products (seller_id,category_id,name,price,description,image)
              VALUES ('$seller_id','$category_id','$name','$price','$description','$image')";

    if(mysqli_query($con,$query)){
        echo "1";
    } else {
        echo "0";
    }
}

?>