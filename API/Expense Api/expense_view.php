<?php
    include 'connect.php';
    $sql = "SELECT * FROM a_tracker";
    $req = mysqli_query($con, $sql);
    $response = array();
    while($row=mysqli_fetch_array($req))
    {
        $value["date"] = $row["date"];
        $value["amount"] = $row["amount"];
        $value["category"] = $row["category"];
        array_push($response, $value);
    }
    
    echo json_encode($response);

?>