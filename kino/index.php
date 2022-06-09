<?php
	$mysqli=new mysqli('localhost','root','','kino');
	if ($mysqli->connect_errno) {
		echo "Не удалось подключиться к MySQL: " . mysqli_connect_error();
		return false;
	};
	$mysqli->set_charset("utf8");
	$method = $_SERVER['REQUEST_METHOD'];
	if ($method == 'GET'){
		$a=array();
		
		if ($_GET['id']==1){
			
			$text="select * from cinemas where name like '%".$_GET['name']."%' or
address like '%".$_GET['name']."%'";
		
			$result=$mysqli->query($text);
			while ($row = mysqli_fetch_assoc($result)){
				$b=array("name"=>$row['name'],"address"=>$row['address']);
				$a[]=$b;
			}
		}
		if ($_GET['id']==2){
  			$text=" SELECT * FROM films   where name like '%".$_GET['name']."%'";
			$result=$mysqli->query($text);
			while ($row = mysqli_fetch_assoc($result)){
				$b=array("name"=>$row['name']);
				$a[]=$b;
			}
			
		}		
		if ($_GET['id']==3){
			
			$text="select * from theatres";
		
			$result=$mysqli->query($text);
			while ($row = mysqli_fetch_assoc($result)){
				$b=array("name"=>$row['name'],"id"=>$row['ID']);
				$a[]=$b;
			}
		}

		echo json_encode($a);
	};
	if ($method == 'POST'){
		
		if ($_POST['id']==1){
			$text="INSERT INTO `theatres`(`Name`, `address`) VALUES ('".$_POST['name']."','".$_POST['address']."')";
			$result=$mysqli->query($text);
			echo $result;
		}
		if ($_POST['id']==2){
			$text="INSERT INTO `films`(`name`) VALUES ('".$_POST['name']."')";
			$result=$mysqli->query($text);
			$text="SELECT MAX(`ID`) as id FROM `films`"; 
			$result=$mysqli->query($text);
			if ($row = mysqli_fetch_assoc($result)){
				echo $row['id'];

			}
		}
		if ($_POST['id']==3){
			$text="INSERT INTO `theatres_films`(`theatreID`, `filmID`) VALUES (".$_POST['theatreID'].",".$_POST['filmID'].")";
			$result=$mysqli->query($text);
			echo $result;
		}
		
	};
?>