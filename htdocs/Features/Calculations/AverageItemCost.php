<?php
include '../../connect.php';
$conn = OpenCon();

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Construct the query to calculate the average price of all products
$query = "SELECT AVG(Pro_Price) AS AveragePrice FROM Stock_Price";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $averagePrice = $row['AveragePrice'];

    echo "Average Price of All Products: $averagePrice";
} else {
    echo "0 results";
}

$conn->close();
?>
