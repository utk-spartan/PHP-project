<center>
<?php 
	include 'header.php';
?>
<form action="<?php echo $_SERVER['PHP_SELF'];?>" method="post">
	<select name="value">
		<option selected disabled class="hideoption">Select a table</option>
		<option value="doctor">Doctors</option>
		<option value="nurse">Nurses</option>
		<option value="receptionist">Receptionists</option>
		<option value="equipments">Equipment</option>
		<option value="medicine">Medicine</option>
		<option value="patient">Patients</option>
		<option value="room">Rooms</option>
	</select>
	<input type="submit" name="view" value="View">
	<input type="submit" name="insert" value="Insert">
	<input type="submit" name="update" value="Update">
	<br>
	<?php
		if(isset($_POST['view'])){
			$val=$_POST['value'];
			select("select * from $val;",$con);

		}
		else if(isset($_POST['insert'])){
			$val=$_POST['value'];
			$q=$con->query("desc $val;");
			$row=$q->num_rows;
			$col=$q->field_count;

			echo "<br><table>";
			for($j=0;$j<$col;$j++){
					$c=$q->fetch_field();
					echo "<th>",$c->name,"</th>";
				}
			echo "<th>Insert</th>";
			for($i=0;$i<$row;$i++){
				$r=$q->fetch_row();
				echo "<tr>";
				for($j=0;$j<$col;$j++){
					echo "<td>",$r[$j],"</td>";
				}
				echo "<td><input type=text name=new[]></td></tr>";
			}
			echo "</table>";
			echo "<br><input type=submit name=conf_ins value=INSERT>";
			$_SESSION['row']=$row;
			$_SESSION['ins_in']=$val;
			
		}
		
		else if(isset($_POST['conf_ins'])){
				//$con->query("insert into $val values();");
			$row=$_SESSION['row'];
			$val=$_SESSION['ins_in'];
			$q="";
			for($i=0;$i<$row;$i++){
					$q=$q.$_POST['new'][$i];
					if($i!=$row-1)$q=$q.",";
				}
			$q="insert into $val values($q);";
			echo $q;
			//$con->query($q);
		}
		else if(isset($_POST['update'])){
			$val=$_POST['value'];
			$q=$con->query("select * from $val;");
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
				echo "<td class=rbut><input type=radio name=up[]></td></tr>";
			}
			echo "</table><br>";
			echo "<br><input type=submit name=conf_up value=UPDATE>";
		}
		else if(isset($_POST['conf_up'])){
			
		}
	?>
	
</form>
</center>