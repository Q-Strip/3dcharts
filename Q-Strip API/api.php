<?php


include 'connect.php';

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

$devicename 	= htmlspecialchars($_GET["devicename"], ENT_QUOTES);
$devicetoken    = htmlspecialchars($_GET["devicetoken"], ENT_QUOTES);
$devicegroup    = htmlspecialchars($_GET["devicegroup"], ENT_QUOTES);
$sweatrate 	    = htmlspecialchars($_GET["sweatrate"], ENT_QUOTES);

// Validate the Bearer token
function validateToken($token) {
    global $conn;
    $sql = "SELECT * FROM users WHERE token = '$token'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        return true;
    }
    return false;
}

// Check and validate the Bearer token from the header
$headers = apache_request_headers();
if (isset($headers['Authorization'])) {
    $bearerToken = $headers['Authorization'];
    $token = str_replace('Bearer ', '', $bearerToken);
    
    if (!validateToken($token)) {
        header('HTTP/1.0 401 Unauthorized');
        echo 'Invalid Token';
        exit;
    }
} else {
    header('HTTP/1.0 401 Unauthorized');
    echo 'Token not found';
    exit;
}



$sql ="INSERT INTO clouddata(devicename, devicetoken, devicegroup, sweatrate) VALUES ('".$devicename."', '".$devicetoken."', '".$devicegroup."', '".$sweatrate."')"; 

if (validateToken($token)){

	if ($conn->query($sql) === TRUE) {
		echo "New record created successfully";
		} else {
		echo "Error: " . $sql . "<br>" . $conn->error;
		}
}


?>
			

