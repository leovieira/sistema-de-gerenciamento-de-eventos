<?php
	include_once("settings/config.php");
	include_once("settings/connection.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and isset($_GET['cod_evento'])) {
		if ($_GET['key']!=null and $_GET['cod_evento']!=null) {
			if ($_GET['key']==$key) {
				if ($connection) {
					$cod_evento = $_GET['cod_evento'];
					/*$rs = mysqli_query($connection, "SELECT * FROM equipes WHERE cod_evento=$cod_evento 
					AND votos=(SELECT MAX(votos) FROM equipes WHERE cod_evento=$cod_evento);");
					if ($rs) {
						$dados = mysqli_fetch_assoc($rs);
						$num_linhas = mysqli_num_rows($rs);
						if ($num_linhas==1) {
							$result['cod_equipe'] = $dados['cod_equipe'];
							$result['nome'] = $dados['nome'];
							$result['descricao'] = $dados['descricao'];
							$result['integrantes'] = $dados['integrantes'];
							$result['votos'] = $dados['votos'];
							$result['hash'] = $dados['hash'];
							$result['cod_evento'] = $dados['cod_evento'];
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
						$result['msg_error'] = "Falha ao atualizar os dados!";
						echo json_encode($result, JSON_PRETTY_PRINT);
					}*/
					$rs = mysqli_query($connection, "SELECT * FROM equipes WHERE cod_evento=$cod_evento 
					ORDER BY votos DESC LIMIT 3;");
					if ($rs) {
						$num_linhas = mysqli_num_rows($rs);
						if ($num_linhas>=1) {
							$equipes = array();
							$dados = array();
							while ($row = mysqli_fetch_assoc($rs)) {
								$dados['cod_equipe'] = $row['cod_equipe'];
								$dados['nome'] = $row['nome'];
								$dados['descricao'] = $row['descricao'];
								$dados['integrantes'] = $row['integrantes'];
								$dados['votos'] = $row['votos'];
								$dados['hash'] = $row['hash'];
								$dados['cod_evento'] = $row['cod_evento'];
								$equipes[] = $dados;
							}
							$result['equipes'] = $equipes;
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