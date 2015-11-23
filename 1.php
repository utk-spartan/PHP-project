<?php 
	include 'header.php';
	$id = $_SESSION['id'];
 	$q1=$con->query("select * from doctor where did='$id';");
	$q2=$con->query("select * from receptionist where rid='$id';");
	if($q1->num_rows>0){
		echo "fuked";
		header("Location: doctor.php");
	}
	
	else if($q2->num_rows>0){
		header("Location: receptionist.php");
	}
	else echo"fuk off";

?>