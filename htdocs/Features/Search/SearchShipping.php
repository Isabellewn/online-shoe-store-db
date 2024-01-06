<?php
include '../../connect.php';
$conn = OpenCon();

// Getting values
$Tracking_Number = $_POST['Tracking_Number'];

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Connection Successful! <br>";
}

// Construct the query
$query = "SELECT Tracking_Number, Estimated_Shipping_Time FROM shipping_order WHERE Tracking_Number = '$Tracking_Number'";
$result = $conn->query($query);

// Execute the query
if ($result->num_rows > 0) {
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<br> Tracking_Number: " . $row["Tracking_Number"] . " | Estimated_Shipping_Time: " . $row["Estimated_Shipping_Time"] . " <br>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>