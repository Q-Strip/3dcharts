<?php

$a = substr(str_shuffle(str_repeat("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 5)), 0, 5);
$b = substr(str_shuffle(str_repeat("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 5)), 0, 5);
$c = substr(str_shuffle(str_repeat("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 5)), 0, 5);
$d = substr(str_shuffle(str_repeat("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 5)), 0, 5);
$e = substr(str_shuffle(str_repeat("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 5)), 0, 5);
$key = $a.'-'.$b.'-'.$c.'-'.$d.'-'.$e;

include 'connect.php';

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['register'])) {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $email = $_POST['email'];

    $query = "INSERT INTO users (username, password, email, token) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ssss", $username, $password, $email, $key);
    
    if ($stmt->execute()) {
        $registrationSuccess = "<p>Registration successful!<br> You can now add the below token into Your device. As well You have a copy in Your email.</p>";
		
		$to      = $email;
		$subject = 'Your Q-Strip Cloud API Token';
		$message = 'Your Token to connect the Public cloud API is : '.$key.' Save this key if You ever want to connect more devices, Your devices will be automatically registred with it If You enable the Public Cloud API. Thank You for using Q-Strip!';
		$headers = 'From: development@qstrip.nl' . "\r\n" .
		'Reply-To: development@qstrip.nl' . "\r\n" .
		'X-Mailer: PHP/' . phpversion();

	mail($to, $subject, $message, $headers);
		
		
    } else {
        $error = "Registration failed. Please try again.";
    }

    $stmt->close();
}


?>
<style>
#resize{
margin-left:0%; 
margin-right:15%;
}
</style>
<!DOCTYPE html>
<html>
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Register</title>
</head>
<body>
  
    <form method="post" action="">
	<img id="resize" width="100%" src="images/banner.png" alt="Alt" >
        <input type="text" name="username" placeholder="Username" required><br><br>
        <input type="password" name="password" placeholder="Password" required><br><br>
        <input type="email" name="email" placeholder="Email" required><br><br>
        <input type="submit" name="register" value="Register">
		<a href="index.php"> <input type="button" name="Login" value="Login"> </a>
    
    <?php
    if (isset($registrationSuccess)) {
		
		
        echo $registrationSuccess;
		echo '<textarea id="key" name="key" rows="4" cols="40">'.$key.'</textarea>';
		
    } elseif (isset($error)) {
        echo $error;
    }
    ?>
	
	</form>
</body>
</html>