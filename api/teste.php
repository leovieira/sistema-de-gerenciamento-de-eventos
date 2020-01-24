<?php
	function geraString($tamanho) {
		$str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		$str_gerada = null;
		for ($i=0; $i<$tamanho; $i++) {
			$str_gerada .= substr($str, -(rand(1, strlen($str))), 1);
		}
		return $str_gerada;
	}

	echo geraString(4);
?>