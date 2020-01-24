<?php
	include_once("settings/config.php");
	include_once("settings/connection.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and (isset($_GET['nome']) or isset($_GET['cod_evento']) 
	or isset($_GET['cod_administrador']))) {
		if (isset($_GET['nome'])==true and isset($_GET['cod_evento'])==false and isset($_GET['cod_administrador'])==false) {
			if ($_GET['key']!=null and $_GET['nome']!=null) {
				if ($_GET['key']==$key) {
					if ($connection) {
						$nome = $_GET['nome'];
						if ($nome!="@all") {
							$rs = mysqli_query($connection, "SELECT * FROM eventos WHERE nome LIKE '%$nome%';");
						} else {
							$rs = mysqli_query($connection, "SELECT * FROM eventos;");
						}
						if ($rs) {
							$num_linhas = mysqli_num_rows($rs);
							if ($num_linhas>=1) {
								$eventos = array();
								$dados = array();
								while ($row = mysqli_fetch_assoc($rs)) {
									$dados['cod_evento'] = $row['cod_evento'];
									$dados['nome'] = $row['nome'];
									$dados['descricao'] = $row['descricao'];
									$dados['instituicao'] = $row['instituicao'];
									$dados['cod_administrador'] = $row['cod_administrador'];
									$dados['cod_avaliadores'] = $row['cod_avaliadores'];
									$eventos[] = $dados;
								}
								$result['eventos'] = $eventos;
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
		} else if (isset($_GET['nome'])==false and isset($_GET['cod_evento'])==true and isset($_GET['cod_administrador'])==false) {
			if ($_GET['key']!=null and $_GET['cod_evento']!=null) {
				if ($_GET['key']==$key) {
					if ($connection) {
						$cod_evento = $_GET['cod_evento'];
						if ($cod_evento!="@all") {
							$rs = mysqli_query($connection, "SELECT * FROM eventos WHERE cod_evento=$cod_evento;");
						} else {
							$rs = mysqli_query($connection, "SELECT * FROM eventos;");
						}
						if ($rs) {
							$num_linhas = mysqli_num_rows($rs);
							if ($num_linhas>=1) {
								$eventos = array();
								$dados = array();
								while ($row = mysqli_fetch_assoc($rs)) {
									$dados['cod_evento'] = $row['cod_evento'];
									$dados['nome'] = $row['nome'];
									$dados['descricao'] = $row['descricao'];
									$dados['instituicao'] = $row['instituicao'];
									$dados['cod_administrador'] = $row['cod_administrador'];
									$dados['cod_avaliadores'] = $row['cod_avaliadores'];
									$eventos[] = $dados;
								}
								$result['eventos'] = $eventos;
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
		} else if (isset($_GET['nome'])==false and isset($_GET['cod_evento'])==false and 
			isset($_GET['cod_administrador'])==true) {
			if ($_GET['key']!=null and $_GET['cod_administrador']!=null) {
				if ($_GET['key']==$key) {
					if ($connection) {
						$cod_administrador = $_GET['cod_administrador'];
						if ($cod_administrador!="@all") {
							$rs = mysqli_query($connection, "SELECT * FROM eventos WHERE cod_administrador=$cod_administrador;");
						} else {
							$rs = mysqli_query($connection, "SELECT * FROM eventos;");
						}
						if ($rs) {
							$num_linhas = mysqli_num_rows($rs);
							if ($num_linhas>=1) {
								$eventos = array();
								$dados = array();
								while ($row = mysqli_fetch_assoc($rs)) {
									$dados['cod_evento'] = $row['cod_evento'];
									$dados['nome'] = $row['nome'];
									$dados['descricao'] = $row['descricao'];
									$dados['instituicao'] = $row['instituicao'];
									$dados['cod_administrador'] = $row['cod_administrador'];
									$dados['cod_avaliadores'] = $row['cod_avaliadores'];
									$eventos[] = $dados;
								}
								$result['eventos'] = $eventos;
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
		} else if (isset($_GET['nome'])==true and isset($_GET['cod_evento'])==true and isset($_GET['cod_administrador'])==true) {
			$result['error'] = "true";
			$result['msg_error'] = "Passe apenas uma opção como parâmetro (nome, cod_evento ou cod_administrador)!";
			echo json_encode($result, JSON_PRETTY_PRINT);
		}
	} else {
		$result['error'] = "true";
		$result['msg_error'] = "Não foi passado todos parâmetros!";
		echo json_encode($result, JSON_PRETTY_PRINT);
	}
?>