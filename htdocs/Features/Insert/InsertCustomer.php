<?php
include '../../connect.php';
$conn = OpenCon();

// Getting values
$Customer_ID=$_POST['Customer_ID'];
$First_Name=$_POST['First_Name'];
$Last_Name=$_POST['Last_Name'];
$Address=$_POST['Address'];
$Phone_Number=$_POST['Phone_Number'];
$Shipping_Address=$_POST['Shipping_Address'];

// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}
else {
	echo "Connection Succesful! <br>";
}
//construct the query
$query = "INSERT INTO customer VALUES('$Customer_ID','$First_Name','$Last_Name','$Address','$Phone_Number','$Shipping_Address')";

//Execute the query
if ($conn->query($query) === TRUE) {
	echo "New record created successfully!";
} else {
	echo "Error: " . $conn->error;
}
$conn->close();
?>