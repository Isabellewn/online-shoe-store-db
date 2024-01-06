<?php
include '../../connect.php';
$conn = OpenCon();

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$input = $_POST['Order_ID'];

$query = "SELECT Estimated_Shipping_Time FROM shipping_order
WHERE Order_ID = $input";


$result = $conn->query($query);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()){
        echo "<br> Order_ID: ". $row["Order_ID"]. 
        " | Estimated_Shipping_Time: ". $row["Estimated_Shipping_Time"]. 
        "<br>";
    }
} else {
    echo "0 results";
}

?>