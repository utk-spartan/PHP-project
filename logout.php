<?php
	$_SESSION['id']="0";
	session_start();
	
?>
<html>
	<body>
		<?php 
			if(session_destroy())echo"Successfully Logged out";
			else echo"error encountered while logging out";
		?>
		<a href="main.php">Back to main page</a>
	</body>
</html>