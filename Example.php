<?php
include 'DBBackup.class.php';
$db = new DBBackup(array(
	'driver' => 'mysql',
	'host' => '127.0.0.1',
	'user' => 'root',
	'password' => 'mysql',
	'database' => 'control2'
));
$backup = $db->backup();

$date = date( 'Ymd-his' );

if(!$backup['error']){
	// If there isn't errors, show the content
	// The backup will be at $var['msg']
	// You can do everything you want to. Like save in a file.
	// $fp = fopen('file.sql', 'a+');fwrite($fp, $backup['msg']);fclose($fp);
	//echo nl2br($backup['msg']);


	file_put_contents('db-dump-' . $date . '.sql', $backup['msg'] );
} else {
	echo 'An error has ocurred.';
}
?>