<?php
include '../../connect.php';
$conn = OpenCon();

// Getting values
$Company_ID = $_POST['Company_ID'];
$Comp_Name = $_POST['Comp_Name'];
$Comp_Address = $_POST['Comp_Address'];
$Phone_Number = $_POST['Phone_Number'];

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Construct the query
$query = "INSERT INTO Shipping_Company (Company_ID, Comp_Name, Comp_Address, Phone_Number) VALUES ('$Company_ID', '$Comp_Name', '$Comp_Address', '$Phone_Number')";

// Execute the query
if ($conn->query($query) === TRUE) {
    echo "New record created successfully!";
} else {
    echo "Error: " . $conn->error;
}

$conn->close();
?>