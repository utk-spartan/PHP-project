<?php 
	include 'header.php';
	function isSel($opt){
		if(isset($_POST['table'])){
			if($_POST['table']==$opt)echo "selected";
		}
	}

	if(!empty($_POST['table']))$table=$_POST['table'];
?>
<body>
<center>
<form action="<?php echo $_SERVER['PHP_SELF'];?>" method="post">
	<div class=navbar>
		<p class="a" id="selected_table">Select</p>
		<p class="b" onclick="sel_table(0)">Doctors</p>
		<p class="b" onclick="sel_table(1)">Nurses</p>
		<p class="b" onclick="sel_table(2)">Receptionists</p>
		<p class="b" onclick="sel_table(3)">Equipments</p>
		<p class="b" onclick="sel_table(4)">Medicines</p>
		<p class="b" onclick="sel_table(5)">Patients</p>
		<p class="b" onclick="sel_table(6)">Rooms</p>
		<p class=c onclick="logout()">Logout</p>
	</div>
	<div style=position:absolute;width:85%;right:0px;top:0px>
	<ul>
		<li><input hidden type="submit" name="view" value="View " id="view"></li>
		<li><input type="submit" name="insert" value="Insert" id="insert"></li>
		<li><input type="submit" name="update" value="Update" id="update"></li>
	</ul>
	<select name="table" id="table" hidden>
		<option value="doctor" <?php isSel(doctor);?> >Doctors</option>
		<option value="nurse" <?php isSel(nurse);?> >Nurses</option>
		<option value="receptionist" <?php isSel(receptionist);?> >Receptionists</option>
		<option value="equipments" <?php isSel(equipments);?> >Equipments</option>
		<option value="medicine" <?php isSel(medicine);?> >Medicines</option>
		<option value="patient" <?php isSel(patient);?> >Patients</option>
		<option value="room" <?php isSel(room); ?> >Rooms</option>
	</select>
	<?php
		if(isset($_POST['view'])){
			select("select * from $table;",$con);

		}
		else if(isset($_POST['insert'])){
			$q=$con->query("desc $table;");
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
				echo "<tr class=table_r >";
				for($j=0;$j<$col;$j++){
					echo "<td>",$r[$j],"</td>";
				}
				echo "<td><input type=text onchange=showBut(\"conf_ins\") name=new[]></td></tr>";
			}
			echo "</table>";
			echo "<br><input type=submit hidden id=conf_ins name=conf_ins value=INSERT>";
			$_SESSION['row']=$row;
			
		}

		
		else if(isset($_POST['conf_ins'])){
			$row=$_SESSION['row'];
			$q="";
			for($i=0;$i<$row;$i++){
					$q=$q."'".$_POST['new'][$i]."' ";
					if($i!=$row-1)$q=$q.",";
				}
			$q="insert into $table values($q);";
			echo $table," Table updated<br>",$q;
			insert($q,$con);
		}
		else if(isset($_POST['update'])){
			$q=$con->query("select * from $table;");
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
				echo "<td class=rbut><input type=radio name=up onchange=showBut(\"conf_up\") value=$i></td></tr>";
			}
			echo "</table><br>";
			echo "<br><input type=submit hidden name=conf_up id=conf_up value=UPDATE>";
		}
		else if(isset($_POST['conf_up'])){
			$q1=$con->query("select * from $table;");
			$current=$q1->fetch_row();
			for($i=0;$i<$q1->num_rows;$i++){
				if($i==$_POST['up'][0])break;
				$current=$q1->fetch_row();
				
			}
			$_SESSION['row']=$i;
			$q=$con->query("desc $table;");
			$row=$q->num_rows;
			$col=$q->field_count;
			
			echo "<br><table>";
			for($j=0;$j<$col;$j++){
					$c=$q->fetch_field();
					echo "<th>",$c->name,"</th>";
				}
			echo "<th>Current</th><th>New</th>";
			for($i=0;$i<$row;$i++){
				$r=$q->fetch_row();
				echo "<tr class=table_r >";
				for($j=0;$j<$col;$j++){
					echo "<td>",$r[$j],"</td>";
				}
				echo "<td>$current[$i]</td>";
				echo "<td><input type=text onchange=showBut(\"up_val\") name=new_up[]></td></tr>";
			}
			echo "</table>";
			echo "<br><input type=submit hidden name=up_val id=up_val value=Update>";
	
			
		}
		else if(isset($_POST['up_val'])){
			$row=$_SESSION['row'];
			$q=$con->query("select * from $table;");
			
			$fname=array();
			for($j=0;$j<$q->field_count;$j++){
					$ccc=$q->fetch_field();
					$fname[]=$ccc->name;
				}
			$r=$q->fetch_row();
			for($i=0;$i<$q->num_rows;$i++){
				
				if($row==$i)break;
				$r=$q->fetch_row();
			}
			
			$s="";
			$s2="";
			$j=0;
			for(;$j+1<$q->field_count;$j++){
					$s=$s.$fname[$j]."='".$r[$j]."' AND ";
					if(!empty($_POST['new_up'][$j]))$s2=$s2.$fname[$j]."='".$_POST['new_up'][$j]."' , ";
				}
			$s=$s.$fname[$j]."='".$r[$j]."'";
			if(!empty($_POST['new_up'][$j]))$s2=$s2.$fname[$j]."='".$_POST['new_up'][$j]."'";
			$s="UPDATE ".$table." SET ".$s2." WHERE ".$s." ;";
			
			echo "<br>",$s;
			
			insert($s,$con);
			
		}
	?>
	</div>
</form>
<script src="script.js"></script>
<script>
	
	function showBut(but){
		document.getElementById(but).removeAttribute("hidden");
	}

	function hideBut(but){
		document.getElementById(but).setAttribute("hidden","hidden");
	}
	function show_main_but(){
		//showBut("view");
		showBut("insert");
		showBut("update");
	}
	
	function hide_main_but(){
		hideBut("view");
		hideBut("insert");
		hideBut("update");
	}
	//document.getElementById("table").addEventListener("change",show_main_but);
	<?php if(empty($_POST['table']))echo "hide_main_but()"; else echo "selected_table();";?>
	
	function selected_table(){
		var y= document.getElementById("selected_table");
		var x= document.getElementById("table");
		y.innerHTML=x.options[x.selectedIndex].text;
		
	}
	
	function sel_table(a){
		var x= document.getElementById("table");
		x.selectedIndex=a;
		selected_table();
		show_main_but();
		document.getElementById("view").click();
	}	
	
</script>
	<?php colorize_row("#ffe5e5");?>
</center>
</body>