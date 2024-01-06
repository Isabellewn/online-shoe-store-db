<?php
include '../../connect.php';
$conn = OpenCon();

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$input = $_POST['Product_Name'];
$query = "SELECT Product_ID, Product_Name FROM product WHERE Product_Name = '$input'";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()){
        echo "<br> Product_ID: ". $row["Product_ID"]. " | PName: ". $row["Product_Name"]. "<br>";
    }
} else {
    echo "0 results";
}

?>