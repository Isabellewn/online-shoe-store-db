<?php
include '../../connect.php';
$conn = OpenCon();

// Getting values
$First_Name=$_POST['First_Name'];
$Last_Name=$_POST['Last_Name'];
$Address=$_POST['Customer_Address'];
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
$query = "UPDATE customer SET First_Name = $First_Name WHERE Customer_ID = $Customer_ID";
$query1 = "UPDATE customer SET Last_Name = $Last_Name WHERE Customer_ID = $Customer_ID";
$query2 = "UPDATE customer SET Address = $Customer_Address WHERE Customer_ID = $Customer_ID";
$query3 = "UPDATE customer SET Phone_Number = $Phone_Number WHERE Customer_ID = $Customer_ID";
$query4 = "UPDATE customer SET Shipping_Address = $Shipping_Address WHERE Customer_ID = $Customer_ID";


//Execute the query
if ($conn->query($query) === TRUE) {
	echo "New record created successfully!";
} else {
	echo "Error: " . $conn->error;
}
$conn->close();
?>
