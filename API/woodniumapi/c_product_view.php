<!-- <?php

include('connect.php');

$query = "SELECT 
            abhay_products.id,
            abhay_products.name,
            abhay_products.price,
            abhay_products.description,
            abhay_products.image,
            abhay_categories.name AS category_name
          FROM abhay_products
          LEFT JOIN abhay_categories 
          ON abhay_products.category_id = abhay_categories.id";

$result = mysqli_query($con, $query);

$data = array();

while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}

echo json_encode($data);

?> -->

<?php

include('connect.php');

$query = "SELECT * FROM abhay_products";
$result = mysqli_query($con, $query);

$data = array();

while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}

echo json_encode($data);

?>