<?php
$servername = "localhost";
$username = "root"; // your username
$password = "root"; //your password
$database = "online sport shoes store";

// Getting values
$Staff_ID=$_POST['Customer_ID'];
$First_Name=$_POST['First_Name'];
$Last_Name=$_POST['Last_Name'];
$Address=$_POST['Address'];
$Phone_Number=$_POST['Phone_Number'];
$Role=$_POST['Role'];

// Create connection
$conn = new mysqli($servername, $username, $password, $database);
// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}
else {
	echo "Connection Succesful! <br>";
}
//construct the query
$query = "INSERT INTO customer VALUES('$Staff_ID','$First_Name','$Last_Name','$Address','$Phone_Number','$Role')";

//Execute the query
if ($conn->query($query) === TRUE) {
	echo "New record created successfully!";
} else {
	echo "Error: " . $conn->error;
}
$conn->close();
?>