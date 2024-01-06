<?php
include '../../connect.php';
$conn = OpenCon();

// Getting values
$Stock_ID=$_POST['Stock_ID'];
$Stock_Count=$_POST['Stock_Count'];
// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}
else {
	echo "Connection Succesful! <br>";
}
//construct the query
$query = "UPDATE Stock_Count SET Stock_Count = $Stock_Count WHERE Stock_ID = $Stock_ID";

//Execute the query
if ($conn->query($query) === TRUE) {
	echo "New record created successfully!";
} else {
	echo "Error: " . $conn->error;
}
$conn->close();
?>
