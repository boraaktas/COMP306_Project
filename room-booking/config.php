<?php
mysqli_report(MYSQLI_REPORT_OFF);
$db = mysqli_connect('localhost','root','','class_booking', '3302');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

?>


