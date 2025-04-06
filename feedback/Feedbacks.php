<!doctype html>
	<html>
		<head>
  		  <title>
		    Home</title>
		  <link rel="stylesheet" href="css/bootstrap.min.css">
		  <script src="js/bootstrap.min.js"></script>
		  <script src="js/jquery-3.3.1.min.js"></script>
		  <link rel="stylesheet" href="Stylesheet.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		</head>
	<style>
	body{
		background-image:url(Home%20page%20pics/background1.jpeg);
		background-repeat:no-repeat;
		background-attachment:fixed;
}


</style>	
<body>
<?php
require_once('../connection.php');
session_start();
$con = Connect();
if (isset($_POST['submit'])) {
    // Sanitize and retrieve input values
    $name = mysqli_real_escape_string($con, $_POST['name']);
    $email = mysqli_real_escape_string($con, $_POST['email']);
    $comment = mysqli_real_escape_string($con, $_POST['comment']);

    // SQL query to insert feedback data
    $sql = "INSERT INTO feedback (name, e_mail, message) VALUES ('$name', '$email', '$comment')";
    $result = mysqli_query($con, $sql);

    if ($result) {
        echo '<script>alert("Feedback Sent Successfully!! THANK YOU!!");</script>';
        echo '<script>window.location.href = "../index.php";</script>';
    } else {
        echo '<script>alert("Error: ' . mysqli_error($con) . '");</script>';
    }
}
?>


<button class="btn" style="
                        width: 150px;
                        background: orange;
                        color: #fff;
                        border: none;
                        cursor: pointer;
                        padding: 10px;
                        font-size: 18px;
                        margin-left:100px;
						margin-top:25px;
                    "><a href="../index.php" style="
                    text-decoration: none;
                    color: #fff;">Go To Home</a></button>	

<br><br><br>
	<div id="form" >	
		
		<div class="col-md-12" id ="mainform">
			<div class="col-sm-6">
			   <h2  class="contact-us" style="font-size:72px; color:#000;"><strong style="font-size:5cm; color:#555;">F</strong>eedback.</h2>
			</div>
			<div class="col-sm-6" >
				<form method="POST">
				<label><h4>Name:</h4> </label><input type="text" name="name" size="20"  class=" form-control" placeholder="User name" required />
				<label><h4>Email:</h4></label> <input type="email" name="email" size="20"  class=" form-control" placeholder="User Email" required/>
				<h4>Comments:</h4><textarea class="form-control"   name="comment" rows="6"  placeholder="Message"  required></textarea>
				<br>
				<input type="submit" class="btn btn-info" id="btn" style="text-shadow:0 0 3px #000000; font-size:24px;" value="SUBMIT" name="submit">
				<form>
			</div>
		</div>
	</div>


</div>
	</body>
</html>
