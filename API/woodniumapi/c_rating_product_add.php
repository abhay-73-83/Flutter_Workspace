<?php

include('connect.php');

$user_id = $_POST['user_id'];
$product_id = $_POST['product_id'];
$rating = $_POST['rating'];
$feedback = $_POST['feedback'];

if ($user_id=="" || $product_id=="" || $rating=="" || $feedback=="") {
    echo "Please Fill All Fields";
}
else {

    $check = "SELECT * FROM abhay_product_rating 
              WHERE user_id='$user_id' AND product_id='$product_id'";
    
    $res = mysqli_query($con, $check);

    if(mysqli_num_rows($res) > 0){
        echo "Already Rated";
    }
    else {
        $query = "INSERT INTO abhay_product_rating 
                  (user_id,product_id,rating,feedback)
                  VALUES ('$user_id','$product_id','$rating','$feedback')";

        if(mysqli_query($con,$query)){
            echo "1";
        } else {
            echo "0";
        }
    }
}

?>