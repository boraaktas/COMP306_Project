<?php

   include "config.php";
   include "admin_header.php";


   session_start();

   if(!isset($_SESSION['ku_id'])){
      header('location:login_form.php');
   }
?>


<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>admin page</title>

</head>
<body>
   
<div class="container">

   <div class="content">
      <h1>Welcome Admin!</h1>
   </div>

</div>

</body>
</html>