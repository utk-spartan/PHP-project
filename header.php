<?php 
	echo "<h1><center><br>G0PaL Asspatal</h1>";
	
	session_start();
	
	$con = new mysqli("localhost","root","","hospital");
	if ($conn->connect_error) {
    		die("MYSQL Database Connection failed: " . $conn->connect_error);
	} 
?>
