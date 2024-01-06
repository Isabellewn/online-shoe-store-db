<?php
include '../../connect.php';
$conn = OpenCon();

// Getting values
$Order_ID=$_POST['Order_ID'];

// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}
else {
	echo "Connection Succesful! <br>";
}
//construct the query
$query1 = "DELETE FROM order_items WHERE Order_ID = $Order_ID";
$query2 = "DELETE FROM pro_order WHERE Order_ID = $Order_ID";

//Execute the query
if ($conn->query($query1) === TRUE && $conn->query($query2) === TRUE) {
	echo "Record deleted successfully!";
} else {
	echo "Error: " . $conn->error;
}
$conn->close();
?>