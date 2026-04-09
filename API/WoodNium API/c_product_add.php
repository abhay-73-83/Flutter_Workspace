<?php
include('connect.php');

// ------------------ POST DATA ------------------
$seller_id   = $_POST['seller_id'] ?? '';
$category_id = $_POST['category_id'] ?? '';
$name        = $_POST['name'] ?? '';
$price       = $_POST['price'] ?? '';
$description = $_POST['description'] ?? '';

// Validate required fields
if (empty($seller_id) || empty($category_id) || empty($name) || empty($price) || empty($description)) 
    {
    echo "Please fill all fields";
    exit;
}

// ------------------ UPLOAD PATH ------------------
$upload_path = 'uploads/products/';
if (!is_dir($upload_path)) {
    mkdir($upload_path, 0777, true);
}

$base_url = 'http://' . $_SERVER['SERVER_NAME'] . '/woodniumapi/' . $upload_path;

// ------------------ IMAGE UPLOAD ------------------
if (!isset($_FILES['image']) || empty($_FILES['image']['name'])) {
    echo "At least 1 image is required";
    exit;
}

// Handle single/multiple images
$image_names = is_array($_FILES['image']['name']) ? $_FILES['image']['name'] : [$_FILES['image']['name']];
$tmp_names   = is_array($_FILES['image']['tmp_name']) ? $_FILES['image']['tmp_name'] : [$_FILES['image']['tmp_name']];
$errors      = is_array($_FILES['image']['error']) ? $_FILES['image']['error'] : [$_FILES['image']['error']];

$image_count = count($image_names);
if ($image_count < 1 || $image_count > 6) {
    echo "Upload minimum 1 and maximum 6 images";
    exit;
}

$image_urls = [];

for ($i = 0; $i < $image_count; $i++) {
    if ($errors[$i] !== 0) {
        echo "Error uploading image: " . $image_names[$i];
        exit;
    }

    $extension = pathinfo($image_names[$i], PATHINFO_EXTENSION); // keep original extension
    $new_file_name = 'img_' . rand(1000, 9999) . '_' . time() . '.' . $extension;
    $file_path = $upload_path . $new_file_name;
    $file_url  = $base_url . $new_file_name;

    if (!move_uploaded_file($tmp_names[$i], $file_path)) {
        echo "Failed to move image: " . $image_names[$i];
        exit;
    }

    $image_urls[] = $file_url;
}

$images_json = json_encode($image_urls);

// ------------------ VIDEO UPLOAD (OPTIONAL) ------------------
$video_url = NULL;
if (isset($_FILES['video']) && $_FILES['video']['error'] === 0) {
    $extension = pathinfo($_FILES['video']['name'], PATHINFO_EXTENSION);
    $video_name = 'video_' . rand(1000, 9999) . '_' . time() . '.' . $extension;
    $file_path  = $upload_path . $video_name;
    $video_url  = $base_url . $video_name;

    if (!move_uploaded_file($_FILES['video']['tmp_name'], $file_path)) {
        echo "Video upload failed";
        exit;
    }
}

// ------------------ DATABASE INSERT ------------------
$stmt = $con->prepare("INSERT INTO abhay_products (seller_id, category_id, name, price, description, image, video) VALUES (?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("iisssss", $seller_id, $category_id, $name, $price, $description, $images_json, $video_url);

if ($stmt->execute()) {
    echo "1"; // success
} else {
    echo "0"; // failure
}

?>