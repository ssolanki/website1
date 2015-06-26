<?php 
	error_reporting(0);
	// initialize the server
	include './core/init.php';
	$user = json_decode(file_get_contents('php://input')); // get user from json headers
	$emailCode = $user->check;
	$newPassword = $user->newPassword;
	$renewPassword = $user->renewPassword;
	$output = '{"success" : false, "message": ""}';
	$userId = -1;
	//first check for the url
	if(!empty($emailCode)){
		$emailCodeExists = email_code_exists($emailCode);
		//$output = '{"success" : false, "message": "'.$emailCodeExists.'"}';
		if($emailCodeExists){
			$userId = $emailCodeExists;
			if(empty($newPassword) || empty($renewPassword)){
				$output = '{"success" : false, "message": "all fields are required"}';
			}else if($newPassword != $renewPassword){
				$output = '{"success" : false, "message": "Entered password don\'t match."}';
			}else{
				//send the user a link to change the his password to provided email
				$result = reset_password($userId, $newPassword);
				if(!$result){
					$output = '{"success" : false, "message": "We are facing some internal problems"}';
				}else{
					$output = '{"success" : true, "message": "'.$result.'"}';
				}	
			}
		}else{
			$output = '{"success" : "url", "message": "Url not found"}';
		}
	}
	echo $output;
 ?>