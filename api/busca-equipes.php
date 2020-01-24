<?php
	include_once("settings/config.php");
	include_once("settings/connection.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and isset($_GET['cod_evento']) and (isset($_GET['nome']) 
	or isset($_GET['cod_equipe']) or isset($_GET['hash']))) {
		if (isset($_GET['nome'])==true and isset($_GET['cod_equipe'])==false and isset($_GET['hash'])==false) {
			if ($_GET['key']!=null and $_GET['cod_evento']!=null and $_GET['nome']!=null) {
				if ($_GET['key']==$key) {
					if ($connection) {
						$cod_evento = $_GET['cod_evento'];
						$nome = $_GET['nome'];
						if ($nome!="@all") {
							$rs = mysqli_query($connection, "SELECT * FROM equipes WHERE nome LIKE '%$nome%' AND 
							cod_evento='$cod_evento';");
						} else {
							$rs = mysqli_query($connection, "SELECT * FROM equipes WHERE cod_evento=$cod_evento;");
						}
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
		} else if (isset($_GET['nome'])==false and isset($_GET['cod_equipe'])==true and isset($_GET['hash'])==false) {
			if ($_GET['key']!=null and $_GET['cod_evento']!=null and $_GET['cod_equipe']!=null) {
				if ($_GET['key']==$key) {
					if ($connection) {
						$cod_evento = $_GET['cod_evento'];
						$cod_equipe = $_GET['cod_equipe'];
						if ($cod_equipe!="@all") {
							$rs = mysqli_query($connection, "SELECT * FROM equipes WHERE cod_equipe=$cod_equipe AND 
							cod_evento=$cod_evento;");
						} else {
							$rs = mysqli_query($connection, "SELECT * FROM equipes WHERE cod_evento=$cod_evento;");
						}
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
		} else if (isset($_GET['nome'])==false and isset($_GET['cod_equipe'])==false and isset($_GET['hash'])==true) {
			if ($_GET['key']!=null and $_GET['cod_evento']!=null and $_GET['hash']!=null) {
				if ($_GET['key']==$key) {
					if ($connection) {
						$cod_evento = $_GET['cod_evento'];
						$hash = $_GET['hash'];
						if ($hash!="@all") {
							$rs = mysqli_query($connection, "SELECT * FROM equipes WHERE hash='$hash' AND 
							cod_evento=$cod_evento;");
						} else {
							$rs = mysqli_query($connection, "SELECT * FROM equipes WHERE cod_evento=$cod_evento;");
						}
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
		} else if (isset($_GET['nome'])==true and isset($_GET['cod_equipe'])==true and isset($_GET['hash'])==true) {
			$result['error'] = "true";
			$result['msg_error'] = "Passe apenas uma opção como parâmetro (nome, cod_equipe, hash)!";
			echo json_encode($result, JSON_PRETTY_PRINT);
		}
	} else {
		$result['error'] = "true";
		$result['msg_error'] = "Não foi passado todos parâmetros!";
		echo json_encode($result, JSON_PRETTY_PRINT);
	}
?>