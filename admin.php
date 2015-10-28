<center>
<?php 
	include 'header.php';
	
	function select($que,$con){
		$q=$con->query($que);
		$row=$q->num_rows;
		$col=$q->field_count;

		echo "<table>";
		for($j=0;$j<$col;$j++){
				$c=$q->fetch_field();
				echo "<th>",$c->name,"</th>";
			}
		echo "<br>";
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

	select("select * from employee;",$con);
	select("select id from employee;",$con);
	echo "<br>done";

?>
<form action="<?php echo $_SERVER['PHP_SELF'];?>" method="post">
	<select name="value">
		<option value="employee">Employees</option>
		<option value="employee">Equipment</option>
		<option value="employee">Medicine</option>
		<option value="employee">Patients</option>
		<option value="employee">Rooms</option>
	</select>
	<input type="submit" name="view" value="View">
	<input type="submit" name="view" value="Insert">
	<input type="submit" name="view" value="Update">
</form>
</center>