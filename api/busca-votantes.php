<?php
	include_once("settings/config.php");
	include_once("settings/connection.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and isset($_GET['cod_evento']) and isset($_GET['votado'])) {
		if ($_GET['key']!=null and $_GET['cod_evento']!=null and $_GET['votado']!=null) {
			if ($_GET['key']==$key) {
				if ($connection) {
					$cod_evento = $_GET['cod_evento'];
					$votado = $_GET['votado'];
					if ($votado=="@all") {
						$rs = mysqli_query($connection, "SELECT * FROM votantes WHERE cod_evento=$cod_evento;");
					} else if ($votado=="true") {
						$rs = mysqli_query($connection, "SELECT * FROM votantes WHERE cod_evento=$cod_evento AND votado='true';");
					} else if ($votado=="false") {
						$rs = mysqli_query($connection, "SELECT * FROM votantes WHERE cod_evento=$cod_evento AND votado='false';");
					} else {
						$rs = mysqli_query($connection, "SELECT * FROM votantes WHERE cod_evento=$cod_evento;");
					}
					if ($rs) {
						$num_linhas = mysqli_num_rows($rs);
						if ($num_linhas>=1) {
							$votantes = array();
							$dados = array();
							while ($row = mysqli_fetch_assoc($rs)) {
								$dados['cod_votante'] = $row['cod_votante'];
								$dados['hash'] = $row['hash'];
								$dados['cod_evento'] = $row['cod_evento'];
								$dados['votado'] = $row['votado'];
								$votantes[] = $dados;
							}
							$result['votantes'] = $votantes;
							$result['num_linhas'] = $num_linhas;
							$result['error'] = "false";
							$result['msg_error'] = "";
							echo json_encode($result, JSON_PRETTY_PRINT);
						} else if ($num_linhas==0) {
							$result['num_linhas'] = $num_linhas;
							$result['error'] = "false";
							$result['msg_error'] = "";
							echo json_encode($result, JSON_PRETTY_PRINT);
						} else {
							$result['error'] = "true";
							$result['msg_error'] = "Falha ao buscar os dados!";
							echo json_encode($result, JSON_PRETTY_PRINT);
						}
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