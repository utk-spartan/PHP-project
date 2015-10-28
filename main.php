<center>
<?php
include 'header.php';

$flag=0;
if(isset($_POST['sub'])){
	$uname=$_POST['uname'];
	$pass=$_POST['pwd'];
	if(!empty($uname) && !empty($pass)){
		$q=$con->query("select id from employee where username='$uname' and password='$pass';");
		if($q){
			if($q->num_rows>0){
				$row=$q->fetch_assoc();
				$_SESSION['id']=$row['id'];
				header("Location: 1.php");
				die();
			}
			else $flag=2;
		}
		else echo "internal error";
	}
	else $flag=1;
}

                                                                                                                                                                                                             
?>

<form action="<?php echo $_SERVER['PHP_SELF']?>" method="POST">
<table>
<th>LOGIN</th>
<tr>
	<td>User Name</td>
	<td><input type="text" name=uname ></td>
</tr>	
<tr>
	<td>Password</td>
	<td><input type="password" name=pwd></td>
</tr>	
</table>
<input type="submit" name=sub>
</form>
<?php if($flag==1)echo "<font color=\"red\">*Please enter username and password</font>";
else if($flag==2)echo "<font color=\"red\">*Please enter a valid username and password</font>";?>
<center>