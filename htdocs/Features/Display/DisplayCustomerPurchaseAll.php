<?php
include '../../connect.php';
$conn = OpenCon();

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Construct the query to select customers who purchased all items
$query = "SELECT c.Customer_ID, c.First_Name, c.Last_Name
          FROM Customer c
          WHERE NOT EXISTS (
              SELECT p.Product_ID
              FROM Product p
              WHERE NOT EXISTS (
                  SELECT oi.Product_ID
                  FROM Order_Items oi
                  JOIN Pro_Order po ON oi.Order_ID = po.Order_ID
                  WHERE po.Customer_ID = c.Customer_ID AND oi.Product_ID = p.Product_ID
              )
          )";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    // Output data of each row
    echo "Customers who purchased all items: <br>";
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
