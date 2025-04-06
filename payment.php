<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.1/css/all.min.css"
      href="main.js" 
    />
    <script src="main.js"></script>
    <link rel="stylesheet" href="css/pay.css" />
    <title>Payment Form</title>
    <script type="text/javascript">
        function preventBack() {
            window.history.forward(); 
        }
          
        setTimeout("preventBack()", 0);
          
        window.onunload = function () { null };
    </script>
  </head>
<body>
<style>
@import url("https://fonts.googleapis.com/css?family=Poppins&display=swap");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}

body {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background:orange url("images/paym.jpg") center/cover;
  overflow: hidden;
}

.card {
  margin-left: -500px;
  background: linear-gradient(
    to bottom right,
    rgba(255, 255, 255, 0.2),
    rgba(255, 255, 255, 0.05)
  );
  box-shadow: 0 1rem 2rem rgba(0, 0, 0, 0.5), -1px -1px 2px #aaa,
    1px 1px 2px #555;
  backdrop-filter: blur(0.8rem);
  padding: 1.5rem;
  border-radius: 1rem;
  animation: 1s cubic-bezier(0.16, 1, 0.3, 1) cardEnter;
}

.card__row {
  display: flex;
  justify-content: space-between;
  padding-bottom: 2rem;
}

.card__title {
  font-weight: 600;
  font-size: 2.5rem;
  color: black;
  font-weight: 500;
  margin: 1rem 0 1.5rem;
  text-shadow: 0 2px 2px rgba(0, 0, 0, 0.3);
}

.card__col {
  padding-right: 2rem;
}

.card__input {
  background: none;
  border: none;
  border-bottom: dashed 0.2rem rgba(255, 255, 255, 0.15);
  font-size: 1.2rem;
  color: #fff;
  text-shadow: 0 3px 2px rgba(0, 0, 0, 0.3);
}
.card__input--large {
  font-size: 2rem;
}

.card__input::placeholder {
  color: rgba(255, 255, 255, 1);
  text-shadow: none;
}

.card__input:focus {
  outline: none;
  border-color: rgba(255, 255, 255, 0.6);
}

.card__label {
  display: block;
  color: #fff;
  text-shadow: 0 2px 2px rgba(0, 0, 0, 0.4);
  font-weight: 400;
}

.card__chip {
  align-self: flex-end;
}

.card__chip img {
  width: 3rem;
}

.card__brand {
  font-size: 3rem;
  color: #fff;
  min-width: 100px;
  min-height: 75px;
  text-align: right;
  text-shadow: 0 2px 2px rgba(0, 0, 0, 0.4);
}

@keyframes cardEnter {
  from {
    transform: translateY(100vh);
    opacity: 0.1;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}



  
.pay{
  width:200px;
  background: #ff7200;

  border:none;
  height: 40px;
  font-size: 18px;
  border-radius: 5px;
  cursor: pointer;
  color:white;
  transition: 0.4s ease;
  margin-left: 100px;
 

}


.pay a{
  text-decoration: none;
  color: black;
  font-weight: bold;
  
}


.btn{
  width:200px;
  background: #ff7200;

  border:none;
  height: 40px;
  font-size: 18px;
  border-radius: 5px;
  cursor: pointer;
  color:white;
  transition: 0.4s ease;
 
  
  

}


.btn a{
  text-decoration: none;
  color: white;
  font-weight: bold;
  
}

.payment{
  margin-top: -550px;
  margin-left: 1000px;
}
</style>
<?php

require_once('connection.php');
session_start();
$conn = Connect(); 
$id = $_GET["id"];  
$total_amount=0;
// $type = $_POST['radio'];
// $charge_type = $_POST['radio1'];
// $driver_id = $_POST['driver_id_from_dropdown'];
// $customer_username = $_SESSION["login_customer"];
// $car_id = $conn->real_escape_string($_POST['hidden_carid']);
// $rent_start_date = date('Y-m-d', strtotime($_POST['rent_start_date']));
// $rent_end_date = date('Y-m-d', strtotime($_POST['rent_end_date']));
// $return_status = "NR"; // not returned
// $fare = "NA";
// $email  =   $_SESSION['email'] ;

// // $sql="select *from booking where EMAIL='$email' order by BOOK_ID DESC ";
// $cname = mysqli_query($con,$sql);
// $email = mysqli_fetch_assoc($cname);
// $bid=$email['BOOK_ID'];
// $_SESSION['bid']=$bid;
 

$sql0 = "SELECT total_amount FROM rentedcars WHERE id = '$id'";

$result0 = $conn->query($sql0);

if ($result0 && mysqli_num_rows($result0) > 0) {
    $row0 = mysqli_fetch_assoc($result0); 
    $total_amount = $row0["total_amount"];  
} else {
    $total_amount = 0; // Default value or error handling
}



if ($_SERVER["REQUEST_METHOD"] == "Post") {
  $cardNumber = $_POST["cardno"];
  $expDate = $_POST["exp"];
  $cvv = $_POST["cvv"];

  // Validate card number (16 digits)
  if (!preg_match("/^\d{16}$/", $cardNumber)) {
      die("Invalid card number!");
  }

  // Validate expiry date (MM/YY format)
  if (!preg_match("/^(0[1-9]|1[0-2])\/(\d{2})$/", $expDate)) {
      die("Invalid expiry date!");
  }

  // Validate CVV (3 or 4 digits)
  if (!preg_match("/^\d{3,4}$/", $cvv)) {
      die("Invalid CVV!");
  }




  // Insert payment details into the database
  $sql = "INSERT INTO `payments` (BOOK_ID, CARD_NO, EXP_DATE, CVV, PRICE) 
  VALUES ('$id', '$cardNumber', '$expDate', '$cvv', '$total_amount')";
$result = mysqli_query($conn, $sql);

if ($result) {
echo '<script>alert("Payment Successful!"); window.location.href="printbill1.php?id='.$id.'";</script>';
} else {
echo '<script>alert("Payment Failed: ' . mysqli_error($conn) . '"); window.history.back();</script>';
}


// Handle undefined POST variables safely

$id = mysqli_real_escape_string($conn, $id);  

$sql0 = "SELECT total_amount FROM rentedcars WHERE id = '$id'";

$result0 = $conn->query($sql0);

if ($result0 && mysqli_num_rows($result0) > 0) {
    $row0 = mysqli_fetch_assoc($result0); 
    $total_amount = $row0["total_amount"];  
} else {
    $total_amount = 0; // Default value or error handling
}
$cardno = isset($_POST['cardno']) ? $_POST['cardno'] : '';
$exp = isset($_POST['exp']) ? $_POST['exp'] : '';
$cvv = isset($_POST['cvv']) ? $_POST['cvv'] : '';

// Ensure the values are not empty before using them in preg_match
if (!empty($cardno) && preg_match("/^[0-9]{16}$/", $cardno) === false) {
    echo "Invalid card number format.";
}

if (!empty($exp) && preg_match("/^(0[1-9]|1[0-2])\/([0-9]{2})$/", $exp) === false) {
    echo "Invalid expiration date format (MM/YY).";
}

if (!empty($cvv) && preg_match("/^[0-9]{3,4}$/", $cvv) === false) {
    echo "Invalid CVV format.";
}


  // If all validations pass, proceed to process the payment
}





?>


  <h2 class="payment">TOTAL PAYMENT : <a>₹<?php echo $total_amount ?>/-</a></h2>
    <div class="card">
      <form method="POST" action="printbill1.php?id=<?php echo $id ?>" >
        <h1 class="card__title">Enter Payment Information</h1>
        <div class="card__row">
          <div class="card__col">
            <label for="cardNumber" class="card__label">Card Number</label
            ><input
              type="text"
              class="card__input card__input--large"
              id="cardNumber"
              placeholder="xxxx-xxxx-xxxx-xxxx"
              required="required"
              name="cardno"
              maxlength="16"
            />
          </div>
          <div class="card__col card__chip">
            <img src="images/chip.svg" alt="chip" />
          </div>
        </div>
        <div class="card__row">
          <div class="card__col">
            <label for="cardExpiry" class="card__label">Expiry Date</label
            ><input
              type="text"
              class="card__input"
              id="cardExpiry"
              placeholder="xx/xx"
              required="required"
              name="exp"
              maxlength="5"
            />
          </div>
          <div class="card__col">
            <label for="cardCcv" class="card__label">CCV</label
            ><input
              type="password"
              class="card__input"
              id="cardCcv"
              placeholder="xxx"
              required="required"
              name="cvv"
              maxlength="3"
            />
          </div>
          <div class="card__col card__brand"><i id="cardBrand"></i></div>
        </div>
        <input type="submit" VALUE="PAY NOW" class="pay" name="pay">
        <button class="btn"><a href="index.php">CANCEL</a></button>
        <script>
               
           function myFunction() { 
            let text = "ARE YOU SURE?\nYOU WANT TO CANCEL THE PAYMENT?" 
             if (confirm(text) == true) {
                     window.location.href = "cancelbooking.php";
               
             } 
            
           }
          </script>
      </form>
    
    </div>
  </body>

    <script src="https://cdn.jsdelivr.net/npm/cleave.js@1.6.0/dist/cleave.min.js"></script>
    <script src="main.js"></script>
  </body>
</html>