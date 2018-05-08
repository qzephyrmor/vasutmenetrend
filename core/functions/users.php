<?php

include_once('connection.php');


function register_user($register_data) {
	array_walk($registr_data, 'array_sanitize');
	$register_data['password'] = md5($register_data['password']);
	
	$fields = '`' . implode('`, `', array_keys($register_data)) . '`';
	$data = '\'' . implode('\', \'', $register_data) . '\'';
	
	
	mysql_query("INSERT INTO `felhasznalo` ($fields) VALUES ($data)");
}



function register_movie($movie_data) {
	array_walk($movie_data, 'array_sanitize');
	
	$fields = '`' . implode('`, `', array_keys($movie_data)) . '`';
	$data = '\'' . implode('\', \'', $movie_data) . '\'';
	
	
	mysql_query("INSERT INTO `film` ($fields) VALUES ($data)");
}


function add_movgen($movie_gen) {
	array_walk($movie_gen, 'array_sanitize');
	
	$fields = '`' . implode('`, `', array_keys($movie_gen)) . '`';
	$data = '\'' . implode('\', \'', $movie_gen) . '\'';
	
	
	mysql_query("INSERT INTO `f_mufaju` ($fields) VALUES ($data)");
}



function register_ser($ser_data) {
	array_walk($ser_data, 'array_sanitize');
	
	$fields = '`' . implode('`, `', array_keys($ser_data)) . '`';
	$data = '\'' . implode('\', \'', $ser_data) . '\'';
	
	
	mysql_query("INSERT INTO `sorozat` ($fields) VALUES ($data)");
}

function register_per($per_data) {
	array_walk($per_data, 'array_sanitize');
	
	$fields = '`' . implode('`, `', array_keys($per_data)) . '`';
	$data = '\'' . implode('\', \'', $per_data) . '\'';
	
	
	mysql_query("INSERT INTO `szemely` ($fields) VALUES ($data)");
}






function user_count(){

    $stmt= oci_parse(connection(),"SELECT COUNT(*) AS BUZI  FROM FElHASZNALO");
    oci_define_by_name($stmt, 'BUZI', $BUZI);
    oci_execute($stmt);
    oci_fetch($stmt);

    return $BUZI;



}


function user_data($user_name) {
    $stmt1= oci_parse(connection(), "SELECT *  FROM FELHASZNALO WHERE NEVE LIKE '".$user_name."'");
    oci_define_by_name($stmt1, 'data', $data);
    oci_execute($stmt1);
    oci_fetch($stmt1);
    echo $data;

		return $data;

	
	
}

function logged_in() {
	return (isset($_SESSION['login_name'])) ? true : false;
}


//uj function film ellenorzesre
function movie_exists($cim) {
	$cim = sanitize($cim);
	return (mysql_result(mysql_query("SELECT COUNT(`cim`) FROM (`film`) WHERE `cim` ='$cim'"), 0) == 1) ? true : false;
}







?>