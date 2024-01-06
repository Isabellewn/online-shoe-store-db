<?php
include '../../connect.php';
$conn = OpenCon();

// Getting values
$Stock_ID=$_POST['Stock_ID'];
$Stock_Price=$_POST['Stock_Price'];

// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}
else {
	echo "Connection Succesful! <br>";
}
//construct the query
$query = "UPDATE Stock_Price SET Stock_Price = $Stock_Price WHERE Stock_ID = $Stock_ID";

//Execute the query
if ($conn->query($query) === TRUE) {
	echo "New record created successfully!";
} else {
	echo "Error: " . $conn->error;
}
$conn->close();
?>
