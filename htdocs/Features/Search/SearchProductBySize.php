<?php
include '../../connect.php';
$conn = OpenCon();

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$input = $_POST['Product_Size'];

$query = "SELECT SC.Product_ID, SCZ.Pro_Size FROM stock_color_size SCZ, stock_count SC
WHERE SCZ.Stock_ID = SC.Stock_ID
AND SCZ.Pro_Size = $input";


$result = $conn->query($query);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()){
        echo "<br> Product_ID: ". $row["Product_ID"]. 
        " | Pro_Size: ". $row["Pro_Size"]. 
        "<br>";
    }
} else {
    echo "0 results";
}

?>