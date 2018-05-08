<?php 


require 'database/connect.php';
require 'functions/general.php';
require 'functions/users.php';

if (logged_in() === true){
	$session_user_name = $_SESSION['login-name'];
	$user_data = user_data($session_user_name);
	
	//Bannolás: ha egy felhasználó active attribútuma megváltozik, kidobja
	if (user_active($user_data['username']) === false){
		session_destroy();
		header('Location: index.php');
		exit();
	}
}

$errors = array();
?>