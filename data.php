<?php
$credentials = array(
    'host'     => 'localhost',
    'user'     => 'irostik_crmbot',
    'password' => '',
    'database' => 'irostik_crmbot',
);

$json = array(); 

$table = $_REQUEST['table'];
$pname = $_REQUEST['pname'];
$pvalue = $_REQUEST['pvalue'];

$dsn     = 'mysql:host=' . $credentials['host'] . ';dbname=' . $credentials['database'];
$options = array();
try {
	$pdo = new PDO($dsn, $credentials['user'], $credentials['password'], $options);
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
} catch (PDOException $e) {
	$json['error'] = 'MySQL not connected: '.$e->getMessage();
}

$sql = "SELECT * FROM {$table}";
if (!empty($pname) && !empty($pvalue)) {
    $sql .= " WHERE {$pname} = '{$pvalue}'";
}
$json['sql'] = $sql;

try {
    $stm = $pdo->prepare($sql);
    $stm->execute();
    $json['rows'] = $stm->fetchAll(PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    $json['error'] = $e->getMessage();
}

echo json_encode($json, JSON_UNESCAPED_UNICODE);