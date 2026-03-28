<?php
    include 'connect.php';
    $sql = "SELECT * FROM abhay_users";
    $req = mysqli_query($con, $sql);
    $response = array();
    while($row=mysqli_fetch_array($req))
    {
        $value["id"] = $row["id"];
        $value["name"] = $row["name"];
        $value["email"] = $row["email"];
        $value["phone"] = $row["phone"];
        $value["password"] = $row["password"];
        array_push($response, $value);
    }
    
    echo json_encode($response);

?>