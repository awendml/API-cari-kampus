

<?php 
	header('Content-Type: application/json');

	$dbh = new PDO('mysql:host=localhost;dbname=db-cari-kampus', 'root', '');
	
	// API mencari kampus
	$db = $dbh->prepare('SELECT * FROM kampus WHERE nama_kampus LIKE "%'.$_POST['nama_kampus'].'%" ');
	$db->execute();
	$kampus = $db->fetchAll(PDO::FETCH_ASSOC);

	$data = json_encode($kampus);
	echo $data;
 ?>