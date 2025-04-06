<?php
session_start();
require 'connection.php';
$conn = Connect();

if(isset($_POST['distance']) && isset($_POST['id'])) {
    $distance = intval($_POST['distance']);
    $id = intval($_POST['id']);

    // Fetch fare details
    $sql = "SELECT fare, charge_type, rent_start_date, rent_end_date
            FROM rentedcars WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if($row = $result->fetch_assoc()) {
        $fare = $row['fare'];
        $charge_type = $row['charge_type'];
        $no_of_days = (strtotime($row['rent_end_date']) - strtotime($row['rent_start_date'])) / 86400;

        // Calculate Total Amount
        $total_amount = ($charge_type == "km") ? $fare * $distance : $fare * $no_of_days;

        // Insert values into database
        $update_sql = "UPDATE rentedcars SET total_amount = ?, distance = ? WHERE id = ?";
        $update_stmt = $conn->prepare($update_sql);
        $update_stmt->bind_param("dii", $total_amount, $distance, $id);

        if($update_stmt->execute()) {
            echo "Success: Distance and Total Amount Updated!";
        } else {
            echo "Error updating record: " . $update_stmt->error;
        }
    } else {
        echo "Error: Booking ID not found.";
    }
}
?>
