<?php
	define('host', 'localhost');
	define('user', 'root');
	define('pass', '');
	define('db', 'sge');

	function erroDB() {
		$result = array();
		$result['error'] = "true";
		$result['msg_error'] = "Falha ao conectar ao banco de dados!";

		echo json_encode($result, JSON_PRETTY_PRINT);

		unset($result);
	}

	$connection = mysqli_connect(host, user, pass, db) or die(erroDB());
	mysqli_set_charset($connection, 'utf8');
?>