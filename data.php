<?php
$credentials = array(
    'host'     => 'localhost',
    'user'     => 'irostik_crmbot',
    'password' => '',
    'database' => 'irostik_crmbot',
);
$encoding = 'utf8mb4';

$json = array(); 

$dsn     = 'mysql:host=' . $credentials['host'] . ';dbname=' . $credentials['database'];
$options = array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES ' . $encoding);
try {
	$pdo = new PDO($dsn, $credentials['user'], $credentials['password'], $options);
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
} catch (PDOException $e) {
	$json['error'] = 'MySQL not connected: '.$e->getMessage();
}

$table = $_REQUEST['table'];
$sql = "SELECT * FROM {$table}";
$filters = $_REQUEST['filters'];

if (!empty($filters)) {
    $srchstr = array();
    $searchData = json_decode($filters);
    foreach ($searchData->rules as $rule) {
	  $str = $rule->data;
	  $field = $rule->field;
      switch ($rule->op) {
        case 'eq': $srchstr[] = "({$field} = '{$str}')"; break;
        case 'bw': $srchstr[] = "({$field} LIKE '{$str}%')"; break;
      }
    }
    $sql .= " WHERE ".implode(' AND ', $srchstr);
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