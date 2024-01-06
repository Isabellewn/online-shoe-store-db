<?php
include '../../connect.php';
$conn = OpenCon();

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$query = "SELECT * FROM Pro_Order";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<br> Order ID: " . $row["Order_ID"] . " | Status: " . $row["Order_Status"] . " | Total Price: " . $row["Order_Total_Price"] . "<br>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>
