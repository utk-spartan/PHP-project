<?php 
	echo "<h1><center><br>HOSPITAL</h1>";
	echo "<head><link rel=stylesheet type=text/css href=style.css></head>";
	session_start();
	
	$con = new mysqli("localhost","root","","hospital");
	if ($conn->connect_error) {
    		die("MYSQL Database Connection failed: " . $conn->connect_error);
	} 


	function select($que,$con){
		$q=$con->query($que);
		$row=$q->num_rows;
		$col=$q->field_count;

		echo "<br><table>";
		for($j=0;$j<$col;$j++){
				$c=$q->fetch_field();
				echo "<th>",$c->name,"</th>";
			}
		for($i=0;$i<$row;$i++){
			$r=$q->fetch_row();
			echo "<tr>";
			for($j=0;$j<$col;$j++){
				echo "<td>",$r[$j],"</td>";
			}
			echo "</tr>";
		}
		echo "</table>";
	}
?>

