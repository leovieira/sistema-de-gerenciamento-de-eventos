<?php
	include_once("settings/config.php");
	include_once("settings/connection.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and (isset($_GET['cod_equipe']) or isset($_GET['hash']))) {
		if (isset($_GET['cod_equipe'])==true and isset($_GET['hash'])==false) {
			if ($_GET['key']!=null and $_GET['cod_equipe']!=null) {
				if ($_GET['key']==$key) {
					if ($connection) {
						$cod_equipe = $_GET['cod_equipe'];
						$rs = mysqli_query($connection, "UPDATE equipes SET votos=votos+1 WHERE cod_equipe=$cod_equipe;");
						if ($rs and mysqli_affected_rows($connection)==1) {
							$result['error'] = "false";
							$result['msg_error'] = "";
							echo json_encode($result, JSON_PRETTY_PRINT);
						} else {
							$result['error'] = "true";
							$result['msg_error'] = "Falha ao atualizar os dados!";
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
		} else if (isset($_GET['cod_equipe'])==false and isset($_GET['hash'])==true) {
			if ($_GET['key']!=null and $_GET['hash']!=null) {
				if ($_GET['key']==$key) {
					if ($connection) {
						$hash = $_GET['hash'];
						$rs = mysqli_query($connection, "UPDATE equipes SET votos=votos+1 WHERE hash='$hash';");
						if ($rs and mysqli_affected_rows($connection)==1) {
							$result['error'] = "false";
							$result['msg_error'] = "";
							echo json_encode($result, JSON_PRETTY_PRINT);
						} else {
							$result['error'] = "true";
							$result['msg_error'] = "Falha ao atualizar os dados!";
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
		} else if (isset($_GET['cod_equipe'])==true and isset($_GET['hash'])==true) {
			$result['error'] = "true";
			$result['msg_error'] = "Passe apenas uma opção como parâmetro (cod_equipe ou hash)!";
			echo json_encode($result, JSON_PRETTY_PRINT);
		}
	} else {
		$result['error'] = "true";
		$result['msg_error'] = "Não foi passado todos parâmetros!";
		echo json_encode($result, JSON_PRETTY_PRINT);
	}
?>