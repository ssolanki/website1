<?php 
	error_reporting(0);
	// initialize the server
	include './core/init.php';
	$output = '[{ "success": false, "message": ""}]';
	if(isset($_SESSION['id'])){
		$userId = $_SESSION['id'];
		if($result = user_data($userId, 'name', 'email', 'number')){
			$output = '[{ "success": true, "message": [{ "name": "'.$result['name'].'", "email": "'.$result['email'].'", "number":"'.$result['number'].'"}]}]';
		}else{
			$output = '[{ "success": false, "message": "We are facing some internal problems"}]';
		}
	}else{
		$output = '[{ "success": false, "message": "Log in required"}]';
	}
	echo $output;
 ?>