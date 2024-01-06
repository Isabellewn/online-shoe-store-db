<?php
include '../../connect.php';
$conn = OpenCon();
// Getting values
$Stock_ID=$_POST['Stock_ID'];
$Stock_Count=$_POST['Stock_Count'];
$Poduct_ID=$_POST['Product_ID'];
$Pro_Color=$_POST['Pro_Color'];
$Pro_Size=$_POST['Pro_Size'];
$Pro_Price=$_POST['Pro_Price'];

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
else {
    echo "Connection Succesful! <br>";
}

//construct the query
$query1 = "INSERT INTO stock_count VALUES('$Stock_ID','$Stock_Count','$Poduct_ID')";
$query2 = "INSERT INTO stock_color_size VALUES('$Stock_ID','$Pro_Color','$Pro_Size')";
$query3 = "INSERT INTO stock_price VALUES('$Stock_ID', '$Poduct_ID', '$Pro_Price')";



//Execute the query
if (($conn->query($query1) === TRUE) && ($conn->query($query2) === TRUE) && ($conn->query($query3) === TRUE)){
 echo "New record created successfully!";
} else {
 echo "Error: " . $conn->error;
}
$conn->close();
?>
