<?php
include '../../connect.php';
$conn = OpenCon();

$PName = $_POST['PName'];

// Create connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Construct the query
$query = "SELECT DISTINCT c.Customer_ID, c.First_Name, c.Last_Name
    FROM Customer c
    JOIN Pro_Order po ON c.Customer_ID = po.Customer_ID
    JOIN Order_Items oi ON po.Order_ID = oi.Order_ID
    WHERE oi.Product_ID IN (
        SELECT Product_ID
        FROM Product
        WHERE Product_Name = '$PName'
    )";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    // Output data of each row
    echo "Customer Search Results: <br>";
    echo "<table align=\"center\" border=\"1\">";
    echo "<tr><th>Customer ID</th><th>First Name</th><th>Last Name</th></tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>
        <td>" . $row["Customer_ID"] . "</td>
        <td>" . $row["First_Name"] . "</td>
        <td>" . $row["Last_Name"] . "</td>
        </tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?>
