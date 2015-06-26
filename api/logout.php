<?php 
	session_start();
	unset($_SESSION['id']);
	unset($_SESSION['userId']);
	session_destroy();
 ?>