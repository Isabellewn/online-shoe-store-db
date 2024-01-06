<?php
include '../../connect.php';
$conn = OpenCon();

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$query = "SELECT * From Product";
$result = $conn->query($query);
if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<br> PID: " . $row["Product_ID"] . " | PName: " . $row["Product_Name"] . "<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>