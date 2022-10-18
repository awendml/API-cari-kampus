<?php 
	header('Content-Type: application/json');

	$dbh = new PDO('mysql:host=localhost;dbname=db-cari-kampus', 'root', '');
	$query = 'SELECT * FROM ikuti WHERE id_user="'.$_POST['id_user'].'" AND id_kampus="'.$_POST['id_kampus'].'"';

	$db=$dbh->prepare($query);
	$db->execute();
	$cek_ikuti = $db->fetchAll(PDO::FETCH_ASSOC);

	if(empty($cek_ikuti[0])){


		$db1 = $dbh->prepare('INSERT INTO ikuti (id_user, id_kampus) VALUES ('.$_POST['id_user'].', '.$_POST['id_kampus'].')');
		$db1->execute();

	}else{
		$db2 = $dbh->prepare('DELETE FROM ikuti WHERE id_user ='.$_POST['id_user'].' AND id_kampus = '.$_POST['id_kampus'].'');
		$db2->execute();
	}
	$ikuti_kampus = $db->fetchAll(PDO::FETCH_ASSOC);
	$data = json_encode($ikuti_kampus);
 ?>