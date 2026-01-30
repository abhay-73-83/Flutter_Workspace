<?php
    include 'connect.php';
    $sql = "SELECT * FROM p_products";
    $req = mysqli_query($con, $sql);
    $response = array();
    while($row=mysqli_fetch_array($req))
    {
        $value["pname"] = $row["pname"];
        $value["pprice"] = $row["pprice"];
        $value["pdes"] = $row["pdes"];
        array_push($response, $value);
    }
    
    echo json_encode($response);

?>