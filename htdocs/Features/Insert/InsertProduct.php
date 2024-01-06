<?php
include '../../connect.php';
$conn = OpenCon();

// Getting values
$Product_ID = $_POST['Product_ID'];
$Product_Name = $_POST['Product_Name'];
$Description = $_POST['Description'];
$Category = $_POST['Category'];

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Connection Successful! <br>";
}

// Construct the queries
$query1 = "INSERT INTO product VALUES ('$Product_ID', '$Product_Name')";
$query2 = "INSERT INTO product_sub VALUES ('$Product_Name', '$Description', '$Category')";

// Execute the queries
if ($conn->query($query1) === TRUE && $conn->query($query2) === TRUE) {
    echo "New records created successfully!";
} else {
    echo "Error: " . $conn->error;
}

$conn->close();
?>
    

