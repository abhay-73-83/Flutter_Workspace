<?php

include('connect.php');

$upload_path = 'uploads/products/';
if (!is_dir($upload_path)) {
    mkdir($upload_path, 0777, true);
}

$base_url = 'http://' . $_SERVER['SERVER_NAME'] . '/woodniumapi/' . $upload_path;

// ------------------ POST DATA ------------------
$id          = $_POST['id'] ?? '';
$seller_id   = $_POST['seller_id'] ?? '';
$category_id = $_POST['category_id'] ?? '';
$name        = $_POST['name'] ?? '';
$price       = $_POST['price'] ?? '';
$description = $_POST['description'] ?? '';

// Validate
if (empty($id) || empty($seller_id) || empty($category_id) || empty($name) || empty($price) || empty($description)) {
    echo "Please Fill All Fields";
    exit;
}

// ------------------ IMAGE UPDATE ------------------
if (isset($_FILES['image']) && !empty($_FILES['image']['name'][0])) {

    // Convert to array (handle both single/multiple)
    $image_names = is_array($_FILES['image']['name']) ? $_FILES['image']['name'] : [$_FILES['image']['name']];
    $tmp_names   = is_array($_FILES['image']['tmp_name']) ? $_FILES['image']['tmp_name'] : [$_FILES['image']['tmp_name']];
    $errors      = is_array($_FILES['image']['error']) ? $_FILES['image']['error'] : [$_FILES['image']['error']];

    $image_urls = [];

    for ($i = 0; $i < count($image_names); $i++) {

        if ($errors[$i] !== 0) continue;

        $extension = pathinfo($image_names[$i], PATHINFO_EXTENSION);
        $new_name = 'img_' . uniqid() . '.' . $extension;

        $file_path = $upload_path . $new_name;
        $file_url  = $base_url . $new_name;

        if (move_uploaded_file($tmp_names[$i], $file_path)) {
            $image_urls[] = $file_url;
        }
    }

    // Convert to JSON
    $images_json = json_encode($image_urls);

    // Update with images
    $query = "UPDATE abhay_products SET 
              seller_id='$seller_id',
              category_id='$category_id',
              name='$name',
              price='$price',
              description='$description',
              image='$images_json'
              WHERE id='$id'";

} else {

    // Update without changing images
    $query = "UPDATE abhay_products SET 
              seller_id='$seller_id',
              category_id='$category_id',
              name='$name',
              price='$price',
              description='$description'
              WHERE id='$id'";
}

// Execute
if (mysqli_query($con, $query)) {
    echo "1";
} else {
    echo "0";
}

?>