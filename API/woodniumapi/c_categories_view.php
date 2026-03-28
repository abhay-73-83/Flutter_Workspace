<?php

include('connect.php');

$query = "SELECT * FROM abhay_categories";
$result = mysqli_query($con, $query);

$data = array();

while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}

echo json_encode($data);

?>