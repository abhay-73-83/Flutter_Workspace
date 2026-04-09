<?php

// importing db connection
include 'connect.php';

// upload folder
$upload_path = 'uploads/categories/';

//Getting the server ip
 $server_ip = gethostbyname(gethostname());

// upload URL
$upload_url = 'https://' . $_SERVER['SERVER_NAME'] . "/woodniumapi/" . $upload_path;

// getting data from request
$id = $_REQUEST['id'];
$name = $_REQUEST['name'];

// check if file is uploaded
if(isset($_FILES["icon"]["name"]) && $_FILES["icon"]["name"] != "")
{
    // file info
    $fileinfo = pathinfo($_FILES["icon"]["name"]);
    $extension = $fileinfo["extension"];

    // random file name
    $random = 'image_' . rand(1000,9999);

    // file paths
    $file_url = $upload_url . $random . '.' . $extension;
    $file_path = $upload_path . $random . '.' . $extension;

    // upload file
    move_uploaded_file($_FILES["icon"]["tmp_name"], $file_path);

    // update with image
    $sql = "UPDATE abhay_categories 
            SET name='$name', icon='$file_url' 
            WHERE id='$id'";
}
else
{
    // update without image
    $sql = "UPDATE abhay_categories 
            SET name='$name' 
            WHERE id='$id'";
}

// execute query
$ex = mysqli_query($con, $sql);

// response
if($ex){
    echo 1;
}else{
    echo 0;
}

?>