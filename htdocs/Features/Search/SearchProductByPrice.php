<?php
include '../../connect.php';
$conn = OpenCon();

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$input = $_POST['Product_Price'];
$query = "SELECT Stock_ID, Product_ID, Pro_Price FROM stock_price WHERE Pro_Price > $input";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()){
        echo "<br> Stock_ID". $row["Stock_ID"]. " | Product_ID: ". $row["Product_ID"]. " | Product_Price: ". $row["Pro_Price"]. "<br>";
    }
} else {
    echo "0 results";
}

?>