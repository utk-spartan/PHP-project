<?php
	//echo "<head><center><h1><br>HOSPITAL</h1>
		//<link rel=stylesheet type=text/css href=style.css></center></head><p align=right><a href=main.php>Logout</a></p>";
	echo "<head><link rel=stylesheet type=text/css href=style.css></head>";
	session_start();

	$con = new mysqli("localhost","root","","hospital");
	if ($conn->connect_error) {
    		die("MYSQL Database Connection failed: " . $conn->connect_error);
	}

	function insert($que,$con){
		/*$s=$con->query($que);
		if(!$s){
			echo "<script>alert(\"".$con->error."\");</script>";
		}
		else echo"<script>alert(\"The following Query ran successfully:\\n".$que."\");</script>";*/
		echo "<script>alert(\"".$que."\");</script>";
		
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
			echo "<tr class=table_r >";
			for($j=0;$j<$col;$j++){
				echo "<td>",$r[$j],"</td>";
			}
			echo "</tr>";
		}
		echo "</table>";
	}
		function colorize_row($color){
			echo "<script>
			var x=document.getElementsByClassName(\"table_r\");
			var i=1;
			while(i<1000){
				x[i].style.background=\"$color\";
				i=i+2;
			}

			</script>";
	}
?>

