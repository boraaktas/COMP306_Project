<?php
if(!isset($_SESSION)) 
{ 
    session_start(); 
} 
include "edit.php";
include "config.php";

if(isset($POST['update_user'])){
    $name = $_POST['name'];
    $password = $_POST['password'];
    $email = $_POST['email'];
    $surname = $_POST['surname'];
    $academic_level = $_POST['academic_level'];
    $faculty = $_POST['faculty'];
    $ku_id = $_POST['ku_id'];

    $query = "UPDATE users SET firstname='$name', lastname='$surname', mail='$email', password='$password' WHERE ku_id='$ku_id'";
    $query2 = "UPDATE regular_users SET academic_level='$academic_level', faculty='$faculty' WHERE ku_id='$ku_id'";
 
    $query_run = mysqli_query($connection, $query);
    $query_run2 = mysqli_query($connection, $query2);

    if($query_run && $query_run2)
    {
        echo '<script> alert("Data Updated"); </script>';
        header("Location: edit.php");
    }
    else
    {
        echo '<script> alert("Data Not Updated"); </script>';
    }

}

?>

