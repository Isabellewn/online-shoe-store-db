<?php
include '../../connect.php';
$conn = OpenCon();
// Getting values
$First_Name=$_POST['First_Name'];
$Last_Name=$_POST['Last_Name'];
$Staff_Address=$_POST['Staff_Address'];
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
$query = "UPDATE staff SET First_Name = $First_Name WHERE Staff_ID = $Staff_ID";
$query1 = "UPDATE staff SET Last_Name = $Last_Name WHERE Staff_ID = $Staff_ID";
$query2 = "UPDATE staff SET Address = $Staff_Address WHERE Staff_ID = $Staff_ID";
$query3 = "UPDATE staff SET Phone_Number = $Phone_Number WHERE Staff_ID = $Staff_ID";
$query4 = "UPDATE staff SET Role = $Role WHERE Staff_ID = $Staff_ID";


//Execute the query
if ($conn->query($query) === TRUE) {
	echo "New record created successfully!";
} else {
	echo "Error: " . $conn->error;
}
$conn->close();
?>
