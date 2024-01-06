<?php
include '../../connect.php';
$conn = OpenCon();

// Getting values
$Staff_ID=$_POST['Staff_ID'];

// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}
else {
	echo "Connection Succesful! <br>";
}
//construct the query
$query = "DELETE FROM customer WHERE Staff_ID = $Staff_ID";

//Execute the query
if ($conn->query($query) === TRUE) {
	echo "Record deleted successfully!";
} else {
	echo "Error: " . $conn->error;
}
$conn->close();
?>