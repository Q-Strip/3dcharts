<?php
session_start();
include 'connect.php';

foreach ($_SESSION as $key=>$val)
	if ($key == 'token'){
		$token = $val;
	}else {
		$devicename = $val;	
	}



// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$deviceQuery = "SELECT DISTINCT devicename FROM clouddata WHERE devicetoken= '$token'";
$deviceResult = $conn->query($deviceQuery);

$devices = [];
while ($row = $deviceResult->fetch_assoc()) {
    $devices[] = $row['devicename'];
}

if (isset($_GET['device']) && in_array($_GET['device'], $devices)) {
    $selectedDevice = $_GET['device'];
} else {
    $selectedDevice = $devices[0]; // Default to the first device if none is selected
}

$fromDateTime = isset($_GET['fromDateTime']) ? $_GET['fromDateTime'] : null;
$toDateTime = isset($_GET['toDateTime']) ? $_GET['toDateTime'] : null;

$limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 1000;

if ($fromDateTime && $toDateTime) {
    $whereClause .= $selectedDevice ? " AND " : " WHERE ";
    $whereClause .= "timestamp BETWEEN '$fromDateTime' AND '$toDateTime'";
}


$dataQuery = "SELECT timestamp, sweatrate, devicename,devicetoken FROM clouddata WHERE devicename = '$selectedDevice' AND devicetoken = '$token' $whereClause ORDER BY timestamp ASC LIMIT $limit";
$result = $conn->query($dataQuery);

$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = [$row['timestamp'], (float)$row['sweatrate']];
}

$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Q-Strip Nocturnal Perspiration Chart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        #container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        .select-box {
            margin-bottom: 10px;
        }
        select, input[type="number"], input[type="submit"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 10px;
        }
        select {
            width: 200px;
        }
        input[type="submit"] {
            background-color: #ffbe26;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #ffbe26;
        }
        #chart_div {
            width: 100%;
            height: 500px;
        }
    </style>
	<title>Q-Strip Nocturnal Sweat Research Cloud Data</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Timestamp');
            data.addColumn('number', 'Sweatrate');

            var rawData = <?php echo json_encode($data); ?>;
            data.addRows(rawData);

            var options = {
                title: 'Sweatrate by Timestamp for <?php echo $selectedDevice; ?>',
                curveType: 'function',
                legend: { position: 'bottom' }
            };

            var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</head>
<body>

     <h1>Q-Strip Cloud Data</h1>

  
    <div id="container">
	 <div style="display: flex; justify-content: flex-end">
	     <a href="index.php">Logout</a>
	 </div>

      <div class="select-box">
            <h2>Select Device:</h2>
            <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="GET">
                <select name="device" onchange="this.form.submit()">
                    <?php
                        foreach ($devices as $device) {
                            $selected = ($device === $selectedDevice) ? 'selected' : '';
                            echo "<option value=\"$device\" $selected>$device</option>";
                        }
                    ?>
                </select>
				<label for="fromDateTime">From Date and Time:</label>
				<input type="datetime-local" name="fromDateTime" id="fromDateTime" value="<?php echo $fromDateTime; ?>">
				<label for="toDateTime">To Date and Time:</label>
				<input type="datetime-local" name="toDateTime" id="toDateTime" value="<?php echo $toDateTime; ?>">
				<input type="submit" value="Apply Filters"> 
            </form>
        </div>
<!--        <div class="select-box">
            <h2>Select Limit:</h2>
            <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="GET">
                <input type="hidden" name="device" value="<?php echo $selectedDevice; ?>">
                <input type="number" name="limit" value="<?php echo $limit; ?>" onchange="this.form.submit()">
                <input type="submit" value="Set Limit">
            </form>
        </div>
		
-->
		
        <div id="chart_div"></div>
    </div>
	<div id="container"><div style="display: flex; justify-content: flex-start">	 
	 <a href="usermanual/">Instructions</a>
	 </div>
	<p><center> Opensource Nocturnal Perspiration Research Platform Q-Strip 2024</center></p>
	</div>
</body>
</html>
