
<aside>
		<?php
        include_once ('core/functions/users.php');
		if(logged_in() == true){
			include 'includes/widgets/loggedin.php';
		}else {
            include 'includes/widgets/login1.php';
        }
		
		include 'includes/widgets/user_count.php';
		?>


</aside>