<?php 
	error_reporting(0);
	// initialize the server
	include './core/init.php';
	$user = json_decode(file_get_contents('php://input')); // get user from json headers
	$userName = $user->userName;
	$password = $user->password;
	$output = '{"success" : false, "message": ""}';
	if(empty($userName) === true || empty($password) == true){
		$output = '{"success" : false, "message": "Fields are required"}';
	}
	else if(user_exists($userName) == false){
		$output = '{"success" : false, "message": "Can\'t find username. Havn\'t you registred ?"}';
	}else{
		$login = login($userName, $password);
		if($login == false){
			$output = '{"success" : false, "message": "That password was incorrect."}';
		}else{
			//set the sessions
			$_SESSION['id'] = $login;
			$_SESSION['userId'] = uniqid('tourepedia_');
			$userId = $_SESSION['userId'];	
			$output = '{"success" : true, "message": "'.$userId.'"}';
		}
	}
	echo $output;
 ?>