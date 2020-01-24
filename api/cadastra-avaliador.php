<?php
	include_once("settings/config.php");
	include_once("settings/connection.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and isset($_GET['nome']) and isset($_GET['usuario']) 
	and isset($_GET['senha'])) {
		if ($_GET['key']!=null and $_GET['nome']!=null and $_GET['usuario']!=null and $_GET['senha']!=null) {
			if ($_GET['key']==$key) {
				if ($connection) {
					$nome = $_GET['nome'];
					$usuario = $_GET['usuario'];
					$senha = $_GET['senha'];
					$rs = mysqli_query($connection, "INSERT INTO avaliadores (nome, usuario, senha) 
					VALUES ('$nome', '$usuario', '$senha');");
					if ($rs and mysqli_affected_rows($connection)==1) {
						$result['error'] = "false";
						$result['msg_error'] = "";
						echo json_encode($result, JSON_PRETTY_PRINT);
					} else {
						$result['error'] = "true";
						$result['msg_error'] = "Falha ao inserir os dados!";
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