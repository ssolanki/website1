<?php 
	error_reporting(0);
	// initialize the server
	include './core/init.php';
	$user = json_decode(file_get_contents('php://input')); // get user from json headers
	$email = $user->forgotPasswordEmail;
	$output = '{"success" : false, "message": ""}';
	if(empty($email)){
		$output = '{"success" : false, "message": "Email required"}';
	}else if(!email_exists($email)){
		$output = '{"success" : false, "message": "Entered email isn\'t associated with any account"}';
	}else{
		// send the user a link to change the his password to provided email
		$result = forgot_password($email);
		if(!$result){
			$output = '{"success" : false, "message": "We are facing some internal problems."}';
		}else{
			$output = '{"success" : true, "message": "An email has been sent to your email address, Follow that to reset your password."}';
		}
		
	}
	echo $output;
 ?>