<?php
	include_once("settings/config.php");
	include_once("settings/connection.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	function geraString($tamanho) {
		$str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		$str_gerada = null;
		for ($i=0; $i<$tamanho; $i++) {
			$str_gerada .= substr($str, -(rand(1, strlen($str))), 1);
		}
		return $str_gerada;
	}

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and isset($_GET['nome']) and isset($_GET['descricao']) 
	and isset($_GET['integrantes']) and isset($_GET['votos']) and isset($_GET['cod_evento'])) {
		if ($_GET['key']!=null and $_GET['nome']!=null and $_GET['descricao']!=null and $_GET['integrantes']!=null 
		and $_GET['votos']!=null and $_GET['cod_evento']!=null) {
			if ($_GET['key']==$key) {
				if ($connection) {
					$nome = $_GET['nome'];
					$descricao = $_GET['descricao'];
					$integrantes = $_GET['integrantes'];
					$votos = $_GET['votos'];
					$hash = geraString(4);
					$cod_evento = $_GET['cod_evento'];
					$rs = mysqli_query($connection, "INSERT INTO equipes (nome, descricao, integrantes, votos, hash, cod_evento) 
					VALUES ('$nome', '$descricao', '$integrantes', '$votos', '$hash', $cod_evento);");
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