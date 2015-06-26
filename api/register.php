<?php 
	error_reporting(0);
	// initialize the server
	include './core/init.php';
	$newUser = json_decode(file_get_contents('php://input')); // get user from json headers
	$name = $newUser->name;
	$email = $newUser->email;
	$number = $newUser->number;
	$userName = $newUser->userName;
	$password = $newUser->password;
	$repassword = $newUser->repassword;
	$captcha = $newUser->captcha;

	$output = '{"success" : false, "message": ""}';
	if(empty($name) || empty($email) || empty($number) || empty($userName) || empty($password) || empty($repassword)){
		$output = '{"success" : false, "message": "All fields are required!"}';
	}else if(email_exists($email)){
		$output = '{"success" : false, "message": "An account already associated with this email!"}';
	}else if(user_exists($userName)){
		$output = '{"success" : false, "message": "Username already exists. Choose another one."}';
	}else if($password != $repassword){
		$output = '{"success" : false, "message": "Password don\'t match."}';
	}else if($captcha != $_SESSION["pass"]){
		$output = '{"success" : false, "message": "Captcha don\'t match."}';
	}else{
		$registerData = array(
			'name' => $name,
			'email' => $email,
			'number' => $number,
			'userName' 	=> $userName,
			'password' 	=> $password
			);
		if(register_user($registerData)){
			$output = '{"success" : true, "message": "Registered Successfully."}';
		}else{
			$output = '{"success" : false, "message": "Facing some problem. Please try after some time."}';
		}
	}
	echo $output;
 ?>