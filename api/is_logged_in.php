<?php 
	session_start();
	if(isset($_SESSION['userId'])) echo 'authentified';
 ?>