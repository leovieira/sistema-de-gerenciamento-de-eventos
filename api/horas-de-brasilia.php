<?php
	include_once("settings/config.php");

	$result = array();
	$key = 'dpc0p1yim82b5s0tfk3s';

	if ($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key'])) {
		if ($_GET['key']!=null) {
			if ($_GET['key']==$key) {
				$url = "https://www.horariodebrasilia.org/index.php";
				$dadosSite = file_get_contents($url);

				$str1 = explode('<h3 id="dia-topo">', $dadosSite);
				$str2 = explode('</h3>', $str1[1]);

				$data = $str2[0];

				$str1 = explode('<p id="relogio">', $dadosSite);
				$str2 = explode('</p>', $str1[1]);

				$hora = $str2[0];

				if ($data!=null and $hora!=null) {
					$result['data'] = $data;
					$result['hora'] = $hora;
					$result['error'] = "false";
					$result['msg_error'] = "";
				} else {
					$result['error'] = "true";
					$result['msg_error'] = "Falha ao capturar dados do site!";
				}

				echo json_encode($result, JSON_PRETTY_PRINT);
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