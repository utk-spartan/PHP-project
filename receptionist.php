<?php 
	include 'header.php';
	
	$id="sare";//$_SESSION['id'];
	$q=$con->query("select * from receptionist where rid='$id';");
	$r=$q->fetch_row();
?>

<center>
<div class=navbar>
	<p class=a id="selected_table">Select</p>
	<p class=b onclick="show_div(0,this)">New Record</p>
	<p class=b onclick="show_div(1,this)">Edit record</p>
	<p class=b onclick="show_div(2,this)">All Records</p>
	<p class=b onclick="show_div(3,this)">Doctors</p>
	<p class=b onclick="show_div(4,this)">Nurses</p>
	<p class=c><a href="logout.php">Logout</a></p>
</div>
<div style=position:absolute;width:85%;right:0px>
	<div>
		<br>Name:<?php echo $r[2];?> Username:<?php $q=$con->query("select userid from checkemployee where id='$id';");$s=$q->fetch_row();echo $s[0];?>
	</div>
	<div class="div">
		<form method="POST" action="<?php echo $_SERVER['PHP_SELF']?>" >
			<table>
				<tr><td>Patient name</td><td><input type="text" name="pname" value="<?php echo $_POST['pname'];?>"></td></tr>
				<tr><td>Age</td><td><input type="text" name="page" value="<?php echo $_POST['page'];?>"></td></tr>
				<tr><td>Sex</td><td><select name="psex"><option selected hidden disabled>Select</option><option value="m">Male</option><option value="f">Female</option></select></td></tr>
				<tr><td>Address</td><td><input type="text" name="paddress" value="<?php echo $_POST['paddress'];?>"></td></tr>
				<tr><td>Date of Admission</td><td><input type="text" name="pdoa" value="<?php echo $_POST['pdoa'];?>"></td></tr>
				<tr><td>Room</td><td><input type="text" name="proom" value="<?php echo $_POST['proom'];?>"></td></tr>
				<tr><td>Bed</td><td><input type="text" name="pbed" value="<?php echo $_POST['pbed'];?>"></td></tr>
				<tr><td>Patient Contact no.</td><td><input type="text" name="pcontact" value="<?php echo $_POST['pcontact'];?>"></td></tr>
			</table>
			<input type="submit" value="Create Record" name="create_rec">
		</form>
			<?php
				if(isset($_POST['create_rec'])){
					$s="insert into patient(name,age,sex,address,date_of_admit,room_id,bed_no) values('".$_POST['pname']."','".$_POST['page']."','".$_POST['psex']."','".$_POST['paddress']."','".$_POST['pdoa']."','".$_POST['proom']."','".$_POST['pbed']."');";
					insert($s,$con);
					$contact_no=explode(",",$_POST['pcontact']);
					$pat_id=$con->insert_id;
					foreach($contact_no as $contact){
						$s="insert into pcontact(contact,pid) values('$contact',".$pat_id.")";
						insert($s,$con);
					}
				}
			?>
	</div>
	
	<div class="div">
		<div>
			Records
			<?php
				$s="select * from record natural join maintain where maintain.rid='$id';";
				select($s,$con);
			?>
		</div>
		<div>
			Medicines
			<?php select("select * from medicine",$con);?>
		</div>
		<div>
			Equipments
			<?php select("select * from equipments",$con);?>
		</div>
		<form method="POST" action="<?php echo $_SERVER['PHP_SELF']?>">
			Record_id<input type="text" name="rec_id"><br>
			Appointment<input type="text" name="app" value="<?php $d=getdate();echo $d[year]."-".$d[mon]."-".$d[mday]." ".$d[hours].":".$d[minutes].":".$d[seconds];?>"><br>
			Date of Admission<input type="text" name="doa"><br>
			Date of Discharge<input type="text" name="dod"><br>
			Billed for medicines<input type="text" name="medi_bill" value="<?php echo $_POST['medi_bill'];?>"><br>
			Billed for equipments<input type="text" name="eq_bill" value="<?php echo $_POST['eq_bill'];?>"><br>
			<input type="submit" value="Save" name="save">
		</form>
		<?php
			$rec_id=$_POST['rec_id'];
			$q=$con->query("select pid from record where rec_id='$rec_id'");
			$r=$q->fetch_row();
			$pat_id=$r[0];
			if(isset($_POST['save'])){
				$s="update record set appointment='".$_POST['app']."' where record_id='$rec_id';";
				insert($s,$con);
				$s="update patient set date_of_discharge='".$_POST['dod']."',date_of_admit='".$_POST['doa']." where pid='$pat_id';";
				insert($s,$con);
				$medi_bill=explode(",",$_POST['medi_bill']);
				$eq_bill=explode(",",$_POST['eq_bill']);
				foreach($medi_bill as $medi_id){
					$s="insert into medicine_for(code,pid) values('$medi_id',".$pat_id.")";
					insert($s,$con);
				}
				foreach($eq_bill as $eq_id){
					$s="insert into equipments_for(code,pid) values('$eq_id',".$pat_id.")";
					insert($s,$con);
				}
			}
		?>
	</div>
	<div class="div">
		<?php select("select * from record natural join patient ;",$con);?>
	</div>
	<div class="div">
		<?php select("select did as ID,name as Name,specialization as Specialization,type as Type,consulting_room as 'Consulting Room' , contact as 'Contact No.' from doctor left join (select did,group_concat(contact separator ', ') as contact from dcontact group by did ) as t using(did);",$con);
		?>
	</div>
	<div class="div">
		<?php select("select nurse_id as ID,name as Name,sex as Sex, room as 'Room Governed', contact as 'Contact No.' from nurse left join (select nurse_id ,group_concat(contact separator ' ,') as contact from ncontact group by nurse_id ) as t using(nurse_id) left join (select nurse_id,group_concat(room_id separator ' ,') as room from governs group by nurse_id)as q using(nurse_id);",$con);?>
	</div>
</div>
</center>
<script>
	function show_div(a,b){
		var x=document.getElementsByClassName("div");
		for(var i=0;i<5;i++){
			x[i].style.display="none";
		}
		x[a].style.display="initial";
		
		document.getElementById("selected_table").innerHTML=b.innerHTML;
		
	}
	show_div(0,document.getElementById("selected_table"));
</script>
