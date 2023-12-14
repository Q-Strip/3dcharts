<?php
header('Content-Type: text/csv');

$devicename 	= $_GET['devicename'];
$devicetoken 	= $_GET['token'];
$devicepool		= $_GET['pool'];
$year 			= $_GET['year'];

$monthfrom 		= $_GET['monthfrom'];
$dayfrom 		= $_GET['dayfrom'];
$monthto 		= $_GET['monthto'];
$dayto 			= $_GET['dayto'];

$hour 			= $_GET['hour'];
$limit 			= $_GET['limit'];
$order 			= $_GET['order'];

include 'connect.php';

$conn = new mysqli($hostname, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

if ($limit == '-'){
		$sqllimit = '';
}else{
		$sqllimit = 'LIMIT '.$limit;
}
//
$sql = "SELECT timestamp, sweatrate, YEAR(timestamp)as year, MONTH(timestamp)as month, DAY(timestamp)as day, devicename, devicetoken, devicegroup From clouddata WHERE devicename = '$devicename' AND devicetoken = '$devicetoken' AND devicegroup = '$devicepool' ORDER BY timestamp ".$order." ".$sqllimit."";
$result = $conn->query($sql);
//DATE(timestamp) BETWEEN '2023-$monthfrom-$dayfrom' AND '2024-$monthto-$dayto' AND 

//echo $sql;
//month(timestamp) = $month AND day(timestamp)= $day

if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) { 
    $data = $data ."" . $row["timestamp"].";" . $row["sweatrate"].PHP_EOL;
//	
  }
} else {
  echo "0 results";
}
echo $data;
$conn->close();
exit;
?> 
