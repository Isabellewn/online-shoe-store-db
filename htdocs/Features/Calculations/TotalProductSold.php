<?php
include '../../connect.php';
$conn = OpenCon();

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Construct the query to retrieve order ID, total price, and item count for completed orders
$query = "SELECT po.Order_ID, po.Order_Total_Price, COUNT(oi.Product_ID) AS ItemCount
          FROM Pro_Order po
          LEFT JOIN Order_Items oi ON po.Order_ID = oi.Order_ID
          WHERE po.Order_Status = 'delivered'
          GROUP BY po.Order_ID, po.Order_Total_Price";  // Assuming completed orders are the ones with sold items

$result = $conn->query($query);

if ($result->num_rows > 0) {
    echo "<table border='1'>
            <tr>
                <th>Order ID</th>
                <th>Total Price</th>
                <th>Item Count</th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        $orderID = $row["Order_ID"];
        $totalPrice = $row["Order_Total_Price"];
        $itemCount = $row["ItemCount"];

        echo "<tr>
                <td>$orderID</td>
                <td>$totalPrice</td>
                <td>$itemCount</td>
              </tr>";
    }

    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?>
