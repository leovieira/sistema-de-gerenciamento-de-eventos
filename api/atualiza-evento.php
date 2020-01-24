<?php
	include_once("settings/config.php");
	include_once("settings/connection.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and isset($_GET['cod_evento']) and isset($_GET['nome']) 
	and isset($_GET['descricao']) and isset($_GET['instituicao']) and isset($_GET['cod_administrador']) 
	and isset($_GET['cod_avaliadores'])) {
		if ($_GET['key']!=null and $_GET['cod_evento']!=null and $_GET['nome']!=null and $_GET['descricao']!=null 
		and $_GET['instituicao']!=null and $_GET['cod_administrador']!=null and $_GET['cod_avaliadores']!=null) {
			if ($_GET['key']==$key) {
				if ($connection) {
					$cod_evento = $_GET['cod_evento'];
					$nome = $_GET['nome'];
					$descricao = $_GET['descricao'];
					$instituicao = $_GET['instituicao'];
					$cod_administrador = $_GET['cod_administrador'];
					$cod_avaliadores = $_GET['cod_avaliadores'];
					$rs = mysqli_query($connection, "UPDATE eventos SET nome='$nome', descricao='$descricao', 
					instituicao='$instituicao', cod_administrador=$cod_administrador, cod_avaliadores='$cod_avaliadores' 
					WHERE cod_evento=$cod_evento;");
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
	} else {
		$result['error'] = "true";
		$result['msg_error'] = "Não foi passado todos parâmetros!";
		echo json_encode($result, JSON_PRETTY_PRINT);
	}
?>