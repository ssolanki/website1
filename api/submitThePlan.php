<?php 
	error_reporting(0);
	// initialize the server
	include './core/init.php';
	$user = json_decode(file_get_contents('php://input')); // get user from json headers
	// put this in local variables
	$name = $user->leaderName;
	$address =  $user->leaderAddress ;
	$email = $user->leaderEmail ;
	$number = $user->leaderNumber ;
	$planOfTrip = $user->planOfTrip ;
	$preferedDestination = $user->preferedDestination ;
	$startingDate =  $user->startingDate;
	$condidateCount = $user->condidateCount ;
	$numberOfDays = $user->numberOfDays ;
	$budget = $user->budget;
	$captcha = $user->captcha;
	$output = '{"success" : false, "message": ""}';
	//first check for the url
	if(empty($name) || empty($address) || empty($email) || empty($number) || empty($planOfTrip) || empty($preferedDestination) || empty($condidateCount) ||
		empty($numberOfDays) || empty($budget) || empty($startingDate)){
		$output = '{"success" : false, "message": "All fieds are required"}';
	}else if($captcha != $_SESSION["pass"]){
		$output = '{"success" : false, "message": "Captcha Don\'t match"}';
	}else{
		$submitTripData = array(
			'name' => $name,
			'address' => $address,
			'email' => $email,
			'number' => $number,
			'planOfTrip' => $planOfTrip,
			'preferedDestination'=> $preferedDestination,
			'condidateCount' => $condidateCount,
			'numberOfDays' => $numberOfDays,
			'budget' => $budget,
			'startingDate' => $startingDate
			);
		if(send_plan_trip_email($submitTripData)){
			$output = '{"success" : true, "message": "Data Successfully saved"}';
		}else{
			$output = '{"success" : false, "message": "We are facing some internal problems. Please try after some time"}';
		}
	}
	echo $output;
 ?>