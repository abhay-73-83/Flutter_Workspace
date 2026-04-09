<?php
    include 'connect.php';
    $sql = "SELECT * FROM abhay_sellers";
    $req = mysqli_query($con, $sql);
    $response = array();
    while($row=mysqli_fetch_array($req))
    {
        $value["id"] = $row["id"];
        $value["name"] = $row["name"];
        $value["email"] = $row["email"];
        $value["phone"] = $row["phone"];
        $value["password"] = $row["password"];
        $value["shop_name"] = $row["shop_name"];
        $value["pincode"] = $row["pincode"];
        array_push($response, $value);
    }
    
    echo json_encode($response);

?>