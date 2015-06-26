<?php


// this is the house keeping stuff for the users//////////////////////////////////////////////
// check for the user exists or not
function user_exists($userName){
	$userName = sanitize($userName);
	$query = mysql_query("SELECT COUNT(`id`) FROM `users` WHERE `userName` = '$userName'");
	return (mysql_result($query, 0) == 1) ? true : false;
}

// get the user id from userName
function user_id_from_username($userName){
	$userName = sanitize($userName);
	return mysql_result(mysql_query("SELECT `id` FROM `users` WHERE `userName` = '$userName'"), 0, 'id');	
}

// get the userid from email
function user_id_from_email($email){
	$email = sanitize($email);
	return mysql_result(mysql_query("SELECT `id` FROM `users` WHERE `email` = '$email'"), 0, 'id');	
}
// get the email from userId
function email_from_user_id($userId){
	$email = sanitize($userId);
	return mysql_result(mysql_query("SELECT `email` FROM `users` WHERE `id` = $userId"), 0, 'email');	
}



// function to check login /////////////////////////////////////////////////////////////////////
// login the user with provided userName and password
function login($userName, $password){
	$userId = user_id_from_username($userName);
	$userName = sanitize($userName);
	$password = md5($password);
	return (mysql_result(mysql_query("SELECT COUNT(`id`) FROM `users` WHERE `userName` = '$userName' AND password = '$password'"), 0) == 1) ? $userId : false;
}





// registration methods //////////////////////////////////////////////////////////////////////

function email_exists($email){
	$email = sanitize($email);
	$query = mysql_query("SELECT COUNT(`id`) FROM `users` WHERE `email` = '$email'");
	return (mysql_result($query, 0) == 1) ? true : false;
}
function register_user($register_data){
	array_walk($register_data, 'array_sanitize');
	$register_data['password'] = md5($register_data['password']);
	
	$fields = '`'.implode('`, `', array_keys($register_data)).'`';
	
	$data = '\''. implode('\', \'', $register_data). '\'';
	
	if(mysql_query("INSERT INTO `users` ($fields) VALUES ($data) ")){
		return true;
	}else{
		return false;
	}
}


// password forgot. update the emailCode and send thim an email
function forgot_password($email){
	$emailCode = substr(md5($email), 12);
	$userId = user_id_from_email($email);
	$emailCode .= substr(md5(microtime()), 20);
	if(mysql_query("UPDATE `users` SET `emailCode` = '$emailCode' WHERE `id` = $userId")){
                $email = email_from_user_id($userId);
                if(mail($email, "Reset Password url", "Hi dear,\n\n You requested for your password reset. If it was you then click the link bellow to change your password else just ignore this mail. \n http://tourepedia.com/#/reset?check=$emailCode \n\n customer care", "From: customersupport@tourepedia.com" )){
                   return true;
                }
		return false;
	}else{
		return false;
	}
}

// email code exits or not
function email_code_exists($emailCode){
	$emailCode = sanitize($emailCode);
	return mysql_result(mysql_query("SELECT `id` FROM `users` WHERE `emailCode` = '$emailCode'"), 0, 'id');
}

// reset the user password
function reset_password($userId, $newpassword){
	$newpassword = md5(sanitize($newpassword));
	if(mysql_query("UPDATE `users` SET `password` = '$newpassword' WHERE `id` = $userId")){
		mysql_query("UPDATE `users` SET `emailCode` = '-1' WHERE `id` = $userId");
		return "Password Successfully Changed";
	}
	return false;

}
	

// send email to our mail and update the database	

function send_plan_trip_email($planTripData){
	array_walk($planTripData, 'array_sanitize');
	
	$fields = '`'.implode('`, `', array_keys($planTripData)).'`';
	
	$data = '\''. implode('\', \'', $planTripData). '\'';
	
        if(isset($_SESSION['id'])){
		$userId = $_SESSION['id'];
		$fields = $fields. ', `userId`';
		$data = $data.", '".$userId."'";
	}

	if(mysql_query("INSERT INTO `orders` ($fields) VALUES ($data) ")){
                $body  = "Hi \n There is trip for you to plan. Information regrading the trip is following: \n";
                $body .= 'Name: '.$planTripData['name']."\n";  
	        $body .= 'Address: '.$planTripData['address']."\n"; 
		$body .='Email: '.$planTripData['email']."\n"; 
		$body .='Contact Number: '.$planTripData['number']."\n";
		$body .='Plan of Trip: '.	$planTripData['planOfTrip']."\n"; 
		$body .='Prefered Destination'.$planTripData['preferedDestination']."\n";
		$body .='Number of Condidats: '.$planTripData['condidateCount']."\n";
		$body .='Number of Days: '.$planTripData['numberOfDays']."\n"; 
		$body .='Budget:'.$planTripData['budget']."\n";
		$body .='Starting Date of Journey: '.$planTripData['startingDate']."\n"; 
                mail("anands2675@gmail.com", 'Trip to plan', $body, "From:Plan the Tour<planatour@tourepedia>");
		return true;
	}else{
		return false;
	}
}


// get the user data for user info
function user_data($userId){
	$data  = array();
	$userId = (int)$userId;
	
	$func_num_args = func_num_args();
	$func_get_args = func_get_args();
	
	if($func_num_args > 1){
		unset($func_get_args[0]);
		
		$fields = '`'. implode('`, `', $func_get_args) . '`';
		$data = mysql_fetch_assoc(mysql_query("SELECT $fields FROM `users` WHERE `id` = $userId "));
		
		return $data;
	}else{
		return false;
	}
}


// get the trip data for the use
function trip_data($userId){
	$userId = (int)$userId;
	
	$func_num_args = func_num_args();
	$func_get_args = func_get_args();
	
	if($func_num_args > 1){
		unset($func_get_args[0]);
		$fields = '`'. implode('`, `', $func_get_args) . '`';
		$result = mysql_query("SELECT $fields FROM `orders` WHERE `userId` = $userId ");
		$outp = "[";
		while($rs = mysql_fetch_array($result)) {
		    if ($outp != "[") {$outp .= ",";}
		    $outp .= '{';
		    for($i=1;$i< $func_num_args ;$i++){
		    	$outp .= '"'.$func_get_args[$i].'":"'  . $rs[$func_get_args[$i]] . '",';
		    }
		    $outp = rtrim($outp, ",");
		    $outp .= '}';
		}
		$outp .="]";
		return trim($outp);
	}else{
		return false;
	}
}








?>