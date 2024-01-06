<?php
include '../../connect.php';
$conn = OpenCon();

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Construct the query to calculate the average number of shoes purchased by each customer
$query = "SELECT c.Customer_ID, c.First_Name, c.Last_Name, COUNT(oi.Product_ID) AS TotalShoesPurchased
          FROM Customer c
          JOIN Pro_Order po ON c.Customer_ID = po.Customer_ID
          JOIN Order_Items oi ON po.Order_ID = oi.Order_ID
          GROUP BY c.Customer_ID, c.First_Name, c.Last_Name";

$result = $conn->query($query);

if ($result->num_rows > 0) {
    echo "<table border='1'>
            <tr>
                <th>Customer ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Total Shoes Purchased</th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        $customerID = $row["Customer_ID"];
        $firstName = $row["First_Name"];
        $lastName = $row["Last_Name"];
        $totalShoesPurchased = $row["TotalShoesPurchased"];

        echo "<tr>
                <td>$customerID</td>
                <td>$firstName</td>
                <td>$lastName</td>
                <td>$totalShoesPurchased</td>
              </tr>";
    }

    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?>
