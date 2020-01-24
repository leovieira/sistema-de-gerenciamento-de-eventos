<?php
	// Usar este método caso algo der arrado *-*
	// header('Content-Type: application/json; charset=UTF-8');
	header('Content-Type: text/json; charset=UTF-8');

	$array = array();

	if(isset($_GET['nome'])){
		if(!empty($_GET['nome'])){
			$nome = $_GET['nome'];

			$url = "https://www.horariodebrasilia.org/index.php";
			$dadosSite = file_get_contents($url);

			$str1 = explode('<h3 id="dia-topo">', $dadosSite);
			$str2 = explode('</h3>', $str1[1]);

			$data = $str2[0];

			$str1 = explode('<p id="relogio">', $dadosSite);
			$str2 = explode('</p>', $str1[1]);

			$hora = $str2[0];

			$array['data'] = $data;
			$array['hora'] = $hora;
			$array['nome'] = $nome;
			$array['error'] = "false";
			$array['msg_error'] = "Não há nenhum erro!";

			echo json_encode($array, JSON_PRETTY_PRINT);
		} else{
			$array['error'] = "true";
			$array['msg_error'] = "O parâmetro 'nome' está nulo!";

			echo json_encode($array, JSON_PRETTY_PRINT);
		}
	} else{
		$array['error'] = "true";
		$array['msg_error'] = "Não foi passado o parâmetro 'nome' pela URL!";

		echo json_encode($array, JSON_PRETTY_PRINT);
	}
?>