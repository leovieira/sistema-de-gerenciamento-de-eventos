<?php
	include_once("settings/config.php");
	include_once("settings/connection.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and isset($_GET['usuario']) and isset($_GET['senha'])) {
		if ($_GET['key']!=null and $_GET['usuario']!=null and $_GET['senha']!=null) {
			if ($_GET['key']==$key) {
				if ($connection) {
					$usuario = $_GET['usuario'];
					$senha = $_GET['senha'];
					$rs = mysqli_query($connection, "SELECT * FROM avaliadores WHERE usuario='$usuario';");
					if ($rs) {
						$dados = mysqli_fetch_assoc($rs);
						$num_linhas = mysqli_num_rows($rs);
						if ($num_linhas==1) {
							if ($senha==$dados['senha']) {
								$result['cod_avaliador'] = $dados['cod_avaliador'];
								$result['nome'] = $dados['nome'];
								$result['usuario'] = $dados['usuario'];
								$result['senha'] = $dados['senha'];
								$result['login'] = "true";
								$result['num_linhas'] = $num_linhas;
								$result['error'] = "false";
								$result['msg_error'] = "";
								echo json_encode($result, JSON_PRETTY_PRINT);
							} else {
								$result['login'] = "false";
								$result['num_linhas'] = $num_linhas;
								$result['error'] = "false";
								$result['msg_error'] = "";
								echo json_encode($result, JSON_PRETTY_PRINT);
							}
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