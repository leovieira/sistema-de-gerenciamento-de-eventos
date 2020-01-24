<?php
	include_once("settings/config.php");
	include_once("settings/connection.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	$status = false;

	$dados = array();

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and isset($_GET['cod_administrador'])) {
		if ($_GET['key']!=null and $_GET['cod_administrador']!=null) {
			if ($_GET['key']==$key) {
				if ($connection) {
					$cod_administrador = $_GET['cod_administrador'];
					$rs = mysqli_query($connection, "SELECT cod_evento FROM eventos WHERE 
					cod_administrador=$cod_administrador;");
					if ($rs) {
						$num_linhas = mysqli_num_rows($rs);
						if ($num_linhas>=1) {
							while ($row = mysqli_fetch_assoc($rs)) {
								$dados[] = $row['cod_evento'];
							}
							foreach ($dados as $cod_evento) {
								if ($status==false) {
									$rs = mysqli_query($connection, "DELETE FROM equipes WHERE cod_evento=$cod_evento;");
									if ($rs) {
										$rs = mysqli_query($connection, "DELETE FROM votantes WHERE cod_evento=$cod_evento");
										if ($rs){
											$rs = mysqli_query($connection, "DELETE FROM eventos WHERE cod_evento=$cod_evento;");
											if (!$rs) {
												$status = true;
											}
										} else {
											$status = true;
										}
									} else {
										$status = true;
									}
								}
							}
						}
						if ($status==false) {
							$rs = mysqli_query($connection, "DELETE FROM administradores WHERE 
							cod_administrador=$cod_administrador;");
							if ($rs and mysqli_affected_rows($connection)>=1) {
								$result['error'] = "false";
								$result['error_msg'] = "";
								echo json_encode($result, JSON_PRETTY_PRINT);
							} else {
								$result['error'] = "true";
								$result['msg_error'] = "Falha ao deletar os dados!";
								echo json_encode($result, JSON_PRETTY_PRINT);
							}
						} else {
							$result['error'] = "true";
							$result['msg_error'] = "Falha ao deletar os dados!";
							echo json_encode($result, JSON_PRETTY_PRINT);
						}
					} else {
						$result['error'] = "true";
						$result['msg_error'] = "Falha ao deletar os dados!";
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