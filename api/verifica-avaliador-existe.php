<?php
	include_once("settings/config.php");
	include_once("settings/connection.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and isset($_GET['usuario'])) {
		if ($_GET['key']!=null and $_GET['usuario']!=null) {
			if ($_GET['key']==$key) {
				if ($connection) {
					$usuario = $_GET['usuario'];
					$rs = mysqli_query($connection, "SELECT * FROM avaliadores WHERE usuario='$usuario';");
					if ($rs) {
						$num_linhas = mysqli_num_rows($rs);
						$result['num_linhas'] = $num_linhas;
						$result['error'] = "false";
						$result['error_msg'] = "";
						echo json_encode($result, JSON_PRETTY_PRINT);
					} else {
						$result['error'] = "true";
						$result['msg_error'] = "Falha ao buscar os dados!";
						echo json_encode($result, JSON_PRETTY_PRINT);
					}
				} else {
					$result['error'] = "true";
					$result['msg_error'] = "Falha ao conectar ao banco de dados!";
					echo json_encode($result, JSON_PRETTY_PRINT);
				}
			} else {
				$result['error'] = "true";
				$result['msg_error'] = "Chave de autenticação inválida!";
				echo json_encode($result, JSON_PRETTY_PRINT);
			}
		} else {
			$result['error'] = "true";
			$result['msg_error'] = "Todos parâmetros devem ser diferentes de nulo!";
			echo json_encode($result, JSON_PRETTY_PRINT);
		}
	} else {
		$result['error'] = "true";
		$result['msg_error'] = "Não foi passado todos parâmetros!";
		echo json_encode($result, JSON_PRETTY_PRINT);
	}
?>