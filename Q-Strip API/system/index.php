<?php
session_start();

include 'connect.php';

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = "SELECT * FROM users WHERE username = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $user = $result->fetch_assoc();
        if (password_verify($password, $user['password'])) {
            $_SESSION['username'] = $username;
			$_SESSION['token'] = $user['token'];
            header("Location: user_data.php");
        } else {
            $error = "Invalid password";
        }
    } else {
        $error = "Invalid username";
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
    <title>Login</title>
</head>

<body>



<p>

    <form method="post" action="">
	 <img id="resize" width="100%" src="images/banner.png" alt="Alt" >
        <input type="text" name="username" placeholder="Username" required><br><br>
        <input type="password" name="password" placeholder="Password" required><br><br>
        <input type="submit" name="login" value="Login"><br>
		<a href="register.php"> <input type="button" name="Register" value="Register"> </a>
		<?php if (isset($error)) { echo $error; } ?>
    </form>
	 
</p>

	<br>
	
   
</body>
</html>