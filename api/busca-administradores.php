<?php
	include_once("settings/config.php");
	include_once("settings/connection.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and (isset($_GET['usuario']) 
	or isset($_GET['cod_administrador']))) {
		if (isset($_GET['usuario'])==true and isset($_GET['cod_administrador'])==false) {
			if ($_GET['key']!=null and $_GET['usuario']!=null) {
				if ($_GET['key']==$key) {
					if ($connection) {
						$usuario = $_GET['usuario'];
						if ($usuario!="@all") {
							$rs = mysqli_query($connection, "SELECT * FROM administradores WHERE usuario='$usuario';");
						} else {
							$rs = mysqli_query($connection, "SELECT * FROM administradores;");
						}
						if ($rs) {
							$num_linhas = mysqli_num_rows($rs);
							if ($num_linhas>=1) {
								$administradores = array();
								$dados = array();
								while ($row = mysqli_fetch_assoc($rs)) {
									$dados['cod_administrador'] = $row['cod_administrador'];
									$dados['nome'] = $row['nome'];
									$dados['usuario'] = $row['usuario'];
									$dados['senha'] = $row['senha'];
									$administradores[] = $dados;
								}
								$result['administradores'] = $administradores;
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
		} else if (isset($_GET['usuario'])==false and isset($_GET['cod_administrador'])==true) {
			if ($_GET['key']!=null and $_GET['cod_administrador']!=null) {
				if ($_GET['key']==$key) {
					if ($connection) {
						$cod_administrador = $_GET['cod_administrador'];
						if ($cod_administrador!="@all") {
							$rs = mysqli_query($connection, "SELECT * FROM administradores WHERE 
							cod_administrador=$cod_administrador;");
						} else{
							$rs = mysqli_query($connection, "SELECT * FROM administradores;");
						}
						if ($rs) {
							$num_linhas = mysqli_num_rows($rs);
							if ($num_linhas>=1) {
								$administradores = array();
								$dados = array();
								while ($row = mysqli_fetch_assoc($rs)) {
									$dados['cod_administrador'] = $row['cod_administrador'];
									$dados['nome'] = $row['nome'];
									$dados['usuario'] = $row['usuario'];
									$dados['senha'] = $row['senha'];
									$administradores[] = $dados;
								}
								$result['administradores'] = $administradores;
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
		} else if (isset($_GET['usuario'])==true and isset($_GET['cod_administrador'])==true) {
			$result['error'] = "true";
			$result['msg_error'] = "Passe apenas uma opção como parâmetro (usuario ou cod_administrador)!";
			echo json_encode($result, JSON_PRETTY_PRINT);
		}
	} else {
		$result['error'] = "true";
		$result['msg_error'] = "Não foi passado todos parâmetros!";
		echo json_encode($result, JSON_PRETTY_PRINT);
	}
?>