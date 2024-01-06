<?php
include '../../connect.php';
$conn = OpenCon();

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$input = $_POST['Customer_Name'];
$query = "SELECT PO.*, C.First_Name FROM pro_order PO, customer C 
WHERE PO.Customer_ID = C.Customer_ID
AND C.First_Name = '$input'";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()){
        echo "<br> Order_ID". $row["Order_ID"]. 
        " | Order_Status: ". $row["Order_Status"]. 
        " | Order_Total_Price: ". $row["Order_Total_Price"]. 
        " | Customer_Name: ". $row["First_Name"]. 
        "<br>";
    }
} else {
    echo "0 results";
}

?>