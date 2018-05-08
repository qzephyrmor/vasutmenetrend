<?php
include 'core/init.php';
include 'includes/overall/header.php';

if(empty($_POST) === false){
	$required_fields = array('username','password','password_again','name','email');
	foreach($_POST as $key=>$value) {
		if(empty($value) && in_array($key, $required_fields) === true ){
			$errors[] = 'A csillaggal jelölt mezőket ki kell tölteni !';
			break 1;
		}
	}
	
	if(empty($errors) === true){
		if (user_exists ($_POST['username']) === true) {
			$errors[] = 'A felhasználónév \'' . $_POST['username'] . '\' már használatban van' ;
		}
		if (preg_match("/\\s/", $_POST['username']) === true){
			$errors[] = 'A felhasználóneved nem tartalmazhat szóközöket';
		}
		
		if (strlen($_POST['password']) < 6){
			$errors[] = 'A jelszavad legalább 6 karakterből kell hogy álljon';
		}
		if ($_POST['password'] !== $_POST['password_again']) {
			$errors[] = 'A jelszavak nem egyeznek meg';
		}
		if (filter_var($_POST['email'], FILTER_VALIDATE_EMAIL) === false){
			$errors[] = 'Érvényes mailcimet adj meg';
		}
		if (email_exists($_POST['email'] === true)) {
			$errors[] = 'Bocsi, ez a mail cim \'' . $_POST['email'] . '\' már használatban van' ;
		}
		
	}
}



?>
	
	
	<h1>Regisztráció</h1>
	
	<?php
	if (isset($_GET['success']) && empty($_GET['success'])){
		echo 'Sikeresen Regisztráltál !';
	} else {
	
		if(empty($_POST) === false && empty($errors) === true) {
			$register_data = array(
				'username' 	=> $_POST['username'],
				'password' 	=> $_POST['password'],
				'name' 		=> $_POST['name'],
				'email' 	=> $_POST['email']
			);
			register_user($register_data);
			header('Location: register.php?success');
			
			exit();
			
		} else if (empty($errors) === false) {
			echo output_errors($errors);
		}
	
	?>
	
	<form action="" method="post">
		<ul>
		
		
		
			<li>
				Felhasználónév:*:</br>
				<input type="text" name="username">
			</li>
			<li>
				Jelszó*:</br>
				<input type="password" name="password">
			</li>
			<li>
				Jelszó újra*:</br>
				<input type="password" name="password_again">
			</li>
			<li>
				Név*:</br>
				<input type="text" name="name">
			</li>
			<li>
				Email*:</br>
				<input type="text" name="email">
			</li>
			<li>
				<input type="submit" value="Regisztáció">
			</li>
			
			
		</ul>
	</form>
	
<?php 
	}
include 'includes/overall/footer.php';
?>