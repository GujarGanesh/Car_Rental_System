<!DOCTYPE html>
<html>
<?php
session_start();
require 'connection.php';
$conn = Connect();
?>

<head>
    <link rel="shortcut icon" type="image/png" href="assets/img/P.png.png">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/w3css/w3.css">
    <link rel="stylesheet" type="text/css" href="assets/css/customerlogin.css">
    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="assets/css/clientpage.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="assets/css/bookingconfirm.css" />
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

    <?php 
    if (!isset($_GET["id"])) {
        die("Invalid request! No booking ID provided.");
    }

    $id = $_GET["id"];
    $car_return_date = date('Y-m-d');
    $return_status = "R";
    $login_customer = $_SESSION['login_customer'];

    // Fetch rental details
    $sql0 = "SELECT rc.id, rc.rent_end_date, rc.charge_type, rc.rent_start_date, rc.car_id, rc.total_amount, 
                    c.car_name, c.car_nameplate, 
                    c.ac_price_per_day AS fare_per_day, 
                    c.ac_price AS fare_per_km  
             FROM rentedcars rc 
             JOIN cars c ON rc.car_id = c.car_id 
             WHERE rc.id = '$id'";

    $result0 = $conn->query($sql0);

    if ($result0->num_rows == 0) {
        die("Error: Booking details not found.");
    }

    $row0 = $result0->fetch_assoc();
    $rent_end_date = $row0["rent_end_date"];
    $rent_start_date = $row0["rent_start_date"];
    $car_name = $row0["car_name"];
    $car_nameplate = $row0["car_nameplate"];
    $charge_type = $row0["charge_type"];
    $fare_per_day = $row0["fare_per_day"];
    $fare_per_km = $row0["fare_per_km"];

    // Check if form data was submitted (distance traveled or days rented)
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $distance_or_days = isset($_POST['distance_or_days']) ? (float)$_POST['distance_or_days'] : 0;
    } else {
        $distance_or_days = 1; // Default to 1 if no value is given
    }

    // Set fare based on charge type
    $fare = ($charge_type == "days") ? $fare_per_day : $fare_per_km;
    $total_amount = $distance_or_days * $fare;

    // Calculate extra days fine
    function dateDiff($start, $end) {
        return round((strtotime($end) - strtotime($start)) / 86400);
    }

    $extra_days = dateDiff($rent_end_date, $car_return_date);
    $total_fine = ($extra_days > 0) ? $extra_days * 200 : 0;
    $total_amount += $total_fine;

    // Update rentedcars table
    if ($charge_type == "days") {
        $sql1 = "UPDATE rentedcars 
                 SET car_return_date='$car_return_date', 
                     no_of_days='$distance_or_days', 
                     total_amount='$total_amount', 
                     return_status='$return_status' 
                 WHERE id = '$id'";
    } else {
        $sql1 = "UPDATE rentedcars 
                 SET car_return_date='$car_return_date', 
                     distance='$distance_or_days', 
                     no_of_days='" . dateDiff($rent_start_date, $rent_end_date) . "', 
                     total_amount='$total_amount', 
                     return_status='$return_status' 
                 WHERE id = '$id'";
    }

    if ($conn->query($sql1)) {
        // Update car and driver availability
        $sql2 = "UPDATE cars c, driver d, rentedcars rc 
                 SET c.car_availability='yes', 
                     d.driver_availability='yes' 
                 WHERE rc.car_id=c.car_id 
                 AND rc.driver_id=d.driver_id 
                 AND rc.customer_username = '$login_customer' 
                 AND rc.id = '$id'";
        $conn->query($sql2);
    } else {
        die("Error updating record: " . $conn->error);
    }
    ?>

    <div class="container">
        <div class="jumbotron text-center">
            <h1><span class="glyphicon glyphicon-ok-circle"></span> Car Returned</h1>
            <h2>Thank you for using Car Rentals!</h2>
            <h3><strong>Your Order Number:</strong> <?php echo $id; ?></h3>
        </div>
        
        <div class="box text-center">
            <h3>Invoice</h3>
            <h4><strong>Vehicle Name: </strong> <?php echo $car_name; ?></h4>
            <h4><strong>Vehicle Number: </strong> <?php echo $car_nameplate; ?></h4>
            <h4><strong>Fare:</strong> Rs. <?php echo $fare; ?> / <?php echo ($charge_type == "days") ? "day" : "km"; ?></h4>
            <h4><strong>Booking Date: </strong> <?php echo date("Y-m-d"); ?></h4>
            <h4><strong>Start Date: </strong> <?php echo $rent_start_date; ?></h4>
            <h4><strong>Rent End Date: </strong> <?php echo $rent_end_date; ?></h4>
            <h4><strong>Car Return Date: </strong> <?php echo $car_return_date; ?></h4>

            <?php if ($charge_type == "days") { ?>
                <h4><strong>Number of days rented:</strong> <?php echo $distance_or_days; ?> day(s)</h4>
            <?php } else { ?>
                <h4><strong>Distance Travelled:</strong> <?php echo $distance_or_days; ?> km(s)</h4>
            <?php } ?>

            <?php if ($extra_days > 0) { ?>
                <h4><strong>Total Fine:</strong> Rs. <?php echo $total_fine; ?> for <?php echo $extra_days; ?> extra days.</h4>
            <?php } ?>

            <h4><strong>Total Amount: </strong> Rs. <?php echo $total_amount; ?>/-</h4>
        </div>

        <div class="text-center">
            <h6>Warning! <strong>Do not reload this page</strong> or the above display will be lost. If you want a hardcopy, please print it now.</h6>
        </div>
    </div>
</body>
</html>
