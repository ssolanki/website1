<?php 
	error_reporting(0);
	// initialize the server
	include './core/init.php';
	$output = '[{ "success": false, "message": ""}]';
	if(isset($_SESSION['id'])){
		$userId = $_SESSION['id'];
		if($result = trip_data($userId, 'id', 'name', 'email', 'number', 'planOfTrip', 'preferedDestination', 'condidateCount', 'numberOfDays', 'budget','startingDate')){
			$output = '[{ "success": true, "message": '.$result.'}]';
		}else{
			$output = '[{ "success": false, "message": "We are facing some internal problems"}]';
		}
	}else{
		$output = '[{ "success": false, "message": "Log in required"}]';
	}
	echo $output;
 ?>