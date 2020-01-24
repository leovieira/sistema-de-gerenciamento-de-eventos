<?php
	header('Content-Type: application/json; charset=utf-8');
	$result = array();
	$get_key = 'dpc0p1yim82b5s0tfk3s';
	$post_key = 'ghvk0p87gdviebfshf32';
	$put_key = 'sf4e2118v3hfvstwxa5p';
	$delete_key = 'fblfi2ydxk5y78m95h0t';

	if($_SERVER['REQUEST_METHOD']=='GET' and isset($_GET['key']) and isset($_GET['id'])){
		if($_GET['key']==$get_key){
			$result['type'] = 'GET';
			$result['error'] = 'false';
			$result['key'] = $_GET['key'];
			$result['id'] = $_GET['id'];
			echo json_encode($result, JSON_PRETTY_PRINT);
		} else{
			$result['type'] = 'GET';
			$result['error'] = 'true';
			echo json_encode($result, JSON_PRETTY_PRINT);
		}
	}

	if($_SERVER['REQUEST_METHOD']=='POST' and isset($_POST['key']) and isset($_POST['id'])){
		if($_POST['key']==$post_key){
			$result['type'] = 'POST';
			$result['error'] = 'false';
			$result['key'] = $_POST['key'];
			$result['id'] = $_POST['id'];
			echo json_encode($result, JSON_PRETTY_PRINT);
		} else{
			$result['type'] = 'POST';
			$result['error'] = 'true';
			echo json_encode($result, JSON_PRETTY_PRINT);
		}
	}

	if($_SERVER['REQUEST_METHOD']=='PUT' and isset($_PUT['key']) and isset($_PUT['id'])){
		if($_PUT['key']==$put_key){
			$result['type'] = 'PUT';
			$result['error'] = 'false';
			$result['key'] = $_PUT['key'];
			$result['id'] = $_PUT['id'];
			echo json_encode($result, JSON_PRETTY_PRINT);
		} else{
			$result['type'] = 'PUT';
			$result['error'] = 'true';
			echo json_encode($result, JSON_PRETTY_PRINT);
		}
	}

	if($_SERVER['REQUEST_METHOD']=='DELETE' and isset($_DELETE['key']) and isset($_DELETE['id'])){
		if($_DELETE['key']==$delete_key){
			$result['type'] = 'DELETE';
			$result['error'] = 'false';
			$result['key'] = $_DELETE['key'];
			$result['id'] = $_DELETE['id'];
			echo json_encode($result, JSON_PRETTY_PRINT);
		} else{
			$result['type'] = 'DELETE';
			$result['error'] = 'true';
			echo json_encode($result, JSON_PRETTY_PRINT);
		}
	}
?>