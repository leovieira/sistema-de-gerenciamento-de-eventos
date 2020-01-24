<?php
	include_once("settings/config.php");
	include_once("settings/connection.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and isset($_GET['cod_evento']) and (isset($_GET['cod_votante']) 
	or isset($_GET['hash']))) {
		if (isset($_GET['cod_votante'])==true and isset($_GET['hash'])==false) {
			if ($_GET['key']!=null and $_GET['cod_evento']!=null and $_GET['cod_votante']!=null) {
				if ($_GET['key']==$key) {
					if ($connection) {
						$cod_votante = $_GET['cod_votante'];
						$cod_evento = $_GET['cod_evento'];
						$rs = mysqli_query($connection, "SELECT * FROM votantes WHERE cod_votante=$cod_votante;");
						if ($rs) {
							$dados = mysqli_fetch_assoc($rs);
							$num_linhas = mysqli_num_rows($rs);
							if ($num_linhas==1) {
								if ($dados['votado']=='false') {
									$rs = mysqli_query($connection, "UPDATE votantes SET votado='true' 
									WHERE cod_votante=$cod_votante;");
									if ($rs) {
										$result['cod_votante'] = $dados['cod_votante'];
										$result['hash'] = $dados['hash'];
										$result['votado'] = $dados['votado'];
										$result['cod_evento'] = $dados['cod_evento'];
										$result['login'] = "true";
										$result['num_linhas'] = $num_linhas;
										$result['error'] = "false";
										$result['msg_error'] = "";
										echo json_encode($result, JSON_PRETTY_PRINT);
									} else {
										$result['error'] = "true";
										$result['msg_error'] = "Falha ao atualizar dados!";
										echo json_encode($result, JSON_PRETTY_PRINT);
									}
								} else if ($dados['votado']=='true') {
									$result['cod_votante'] = $dados['cod_votante'];
									$result['hash'] = $dados['hash'];
									$result['votado'] = $dados['votado'];
									$result['cod_evento'] = $dados['cod_evento'];
									$result['login'] = "false";
									$result['num_linhas'] = $num_linhas;
									$result['error'] = "false";
									$result['msg_error'] = "";
									echo json_encode($result, JSON_PRETTY_PRINT);
								} else {
									$result['error'] = "true";
									$result['msg_error'] = "Falha ao buscar os dados!";
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
		} else if (isset($_GET['cod_votante'])==false and isset($_GET['hash'])==true) {
			if ($_GET['key']!=null and $_GET['cod_evento']!=null and $_GET['hash']!=null) {
				if ($_GET['key']==$key) {
					if ($connection) {
						$hash = $_GET['hash'];
						$cod_evento = $_GET['cod_evento'];
						$rs = mysqli_query($connection, "SELECT * FROM votantes WHERE hash='$hash' AND cod_evento=$cod_evento;");
						if ($rs) {
							$dados = mysqli_fetch_assoc($rs);
							$num_linhas = mysqli_num_rows($rs);
							if ($num_linhas==1) {
								if ($dados['votado']=='false') {
									$rs = mysqli_query($connection, "UPDATE votantes SET votado='true' 
									WHERE hash='$hash' AND cod_evento=$cod_evento;");
									if ($rs) {
										$result['cod_votante'] = $dados['cod_votante'];
										$result['hash'] = $dados['hash'];
										$result['votado'] = $dados['votado'];
										$result['cod_evento'] = $dados['cod_evento'];
										$result['login'] = "true";
										$result['num_linhas'] = $num_linhas;
										$result['error'] = "false";
										$result['msg_error'] = "";
										echo json_encode($result, JSON_PRETTY_PRINT);
									} else {
										$result['error'] = "true";
										$result['msg_error'] = "Falha ao atualizar dados!";
										echo json_encode($result, JSON_PRETTY_PRINT);
									}
								} else if ($dados['votado']=='true') {
									$result['cod_votante'] = $dados['cod_votante'];
									$result['hash'] = $dados['hash'];
									$result['votado'] = $dados['votado'];
									$result['cod_evento'] = $dados['cod_evento'];
									$result['login'] = "false";
									$result['num_linhas'] = $num_linhas;
									$result['error'] = "false";
									$result['msg_error'] = "";
									echo json_encode($result, JSON_PRETTY_PRINT);
								} else {
									$result['error'] = "true";
									$result['msg_error'] = "Falha ao buscar os dados!";
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
		} else if (isset($_GET['cod_votante'])==true and isset($_GET['hash'])==true) {
			$result['error'] = "true";
			$result['msg_error'] = "Passe apenas uma opção como parâmetro (cod_votante ou hash)!";
			echo json_encode($result, JSON_PRETTY_PRINT);
		}
	} else {
		$result['error'] = "true";
		$result['msg_error'] = "Não foi passado todos parâmetros!";
		echo json_encode($result, JSON_PRETTY_PRINT);
	}
?>