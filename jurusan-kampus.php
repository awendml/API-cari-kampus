<?php 
	header('Content-Type: application/json');

	$dbh = new PDO('mysql:host=localhost;dbname=db-cari-kampus', 'root', '');

    
	// Menampilkan data jurusan sesuai (id) kampus
	$db = $dbh->prepare('SELECT nama_jurusan FROM jurusan WHERE id_kampus=1');
	$db->execute();
	$jurusan = $db->fetchAll(PDO::FETCH_ASSOC);

	$data = json_encode($jurusan);
	echo($data);
 ?>