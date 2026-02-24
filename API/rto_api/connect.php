<?php
$host = "localhost";
$user = "root";
$pass = "";
$dbname = "a_rto_app";

$con = mysqli_connect($host, $user, $pass, $dbname);

if (!$con){
    die("Connection failed: " . mysqli_connect_error());
}
?>