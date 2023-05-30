<?php 

if(!isset($_SESSION)) 
{ 
    session_start(); 
} 
    include('config.php'); 



    $loginFailed = false;

    if(isset($_POST['mail']) && isset($_POST['password'])) {
        $email = $_POST['mail'];
        $password = $_POST['password'];
        
        $login = $db->query("SELECT * FROM USERS where mail='$email' and password='$password'");
        $is_admin = $db->query("SELECT * FROM USERS, ADMINS WHERE mail='$email' AND password='$password' AND users.ku_id = admins.ku_id ");

        if ($is_admin->num_rows>0){
            $_SESSION['ku_id'] = $login->fetch_assoc()['ku_id'];
            header('Location: adminpage.php'); 
        }
        else if($login->num_rows > 0) {
            $_SESSION['ku_id'] = $login->fetch_assoc()['ku_id'];
            header('Location: homepage.php');
        }
        else {
            $loginFailed = true;
        }
    }
    
?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <div class="login-form">

            <p>Log In</p>

            <?php 
                if($loginFailed == true) {
                    echo '<div class="error">Your credentials are wrong. Please check and try again!</div>';
                }
            ?>

            <form action="login.php" method="post">
                <input type="text" name="mail" placeholder="KU Email" />
                <input type="password" name="password" placeholder="Password" />
                <button type="submit">Log In</button>
            </form>

            <h1>If you don't have any account, you can <a href="register.php">Sign Up!</a></h1>

        </div>
    </body>
</html>


<style>

    body {
        background: #77abdd;
        display:flex;
        font-family: sans-serif;
        justify-content: center;
    }

    .login-form {
        width: 400px;
        height: 400px;
        margin-top: 50px;
        text-align: center;
    }

    .login-form p {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }
 
    form input {
        display: block;
        width: 100%;
        padding: 15px;
        border: none;
        margin-bottom: 10px;
        border-radius: 5px;
        font-size: 15px;
        border: 1px solid #ccc;
        border-radius: 10px;
    }

    form button {
        cursor: pointer;
        width: 200px;
        height: 55px;
        background: #53b255;
        color: white;
        font-size: 18px;
        border:none;
        border-radius: 5px;
        background-color: #45a049;
    }

    h1 {
        font-size: 16px;
        color: white;
        font-weight: normal;
    }

    p {
        font-size: 25px;
        color: #FFF;
    }

    .error {
        color: red;
        margin-bottom: 10px;
    }

</style>