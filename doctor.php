<?php 
	include 'header.php';
	
	$id=$_SESSION['id'];
	$q=$con->query("select * from doctor where did='$id';");
	$r=$q->fetch_row();
?>
<center>
<div class=navbar>
	<p class=a id="selected_table">Select</p>
	<p class=b onclick="sel_table_pat()">Patients</p>
	<p class=b onclick="sel_table_med()">Medicines</p>
	<p class=c><a href="logout.php">Logout</a></p>
</div>
<div style=position:absolute;top:0px;right:0px;width:85%;height:100%;margin:none>
	<div>
		<br>Name:<?php echo $r[2];?> Username:us
		<br>Specialization:<?php echo $r[5];?> Consulting Room:<?php echo $r[7]?>
	</div>
	<div id = "pat_info">
		<br>Hover over patient to see its detailed information.
		<?php select("select pid as ID,name as Name,sex as Sex,age as Age,date_of_admit as AdmissionDate,date_of_discharge as DischargeDate
						from (select * from attends  natural join patient) AS t 
						where t.did='$id';"
					 ,$con);
		?>
	</div>
	<div class="pat_info" style="position:absolute;bottom:0px;width:100%">
		<?php 
			select("select *
					from (select * from attends natural join patient) AS t 
					where t.did='$id'
				"
				,$con);
		?>
	</div>


	<div id = "med_info" hidden>
		<?php select("select * from medicine;",$con); ?>
	</div>
</div>
<script>
	function sel_table_pat(){
		document.getElementById("selected_table").innerHTML="Patients";
		document.getElementById("pat_info").removeAttribute("hidden");
		document.getElementById("med_info").setAttribute("hidden","hidden");
	}	
	function sel_table_med(){
		document.getElementById("selected_table").innerHTML="Medicines";
		document.getElementById("med_info").removeAttribute("hidden");
		document.getElementById("pat_info").setAttribute("hidden","hidden");
		hide_all();
	}
	
	var pat_table=document.getElementsByTagName("table")[0];
	var pat_detail_info=document.getElementsByTagName("table")[1];
	var pat_table_row=pat_table.getElementsByTagName("tr");
	var pat_detail_row=pat_detail_info.getElementsByTagName("tr");
	
	
	function hide_all(){
		for(var i=0;i<pat_table_row.length;i++)pat_detail_row[i].style.display="none";
	}
	pat_table.addEventListener("mouseout",hide_all);
	for(var i=1;i<pat_table_row.length;i++){
		hide_all();
		pat_table_row[i].addEventListener("mouseover",function(){showrow(this);});
	}
	function showrow(clicked){
		hide_all();
		pat_detail_row[0].style.display="inherit";
		var i=0;
		while(pat_table_row[i]!=clicked)i++;
		pat_detail_row[i].style.display="inherit";
	}
	
	
</script>
</center>