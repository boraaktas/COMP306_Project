<?php 

if(!isset($_SESSION)) 
{ 
    session_start(); 
} 
    include('config.php'); 
    
    $registerFailed = false;

    if(isset($_POST['ku_id'], $_POST['firstname'], $_POST['lastname'], $_POST['mail'], $_POST['password'])) {

        $firstname = $_POST['firstname'];
        $lastname = $_POST['lastname'];
        $mail = $_POST['mail'];
        $ku_id = $_POST['ku_id'];
        $password = $_POST['password'];

        $birthdate = $_POST['birthdate'];
        $academic_level = $_POST['academic_level'];
        $faculty = $_POST['faculty'];
        $gender = $_POST['gender'];

        $userCheck = $db->query("select * from users where ku_id='$ku_id'");

        if($userCheck->num_rows > 0) {
            $registerFailed = true;
        } 
        else {
            $query = $db->query("insert into users (ku_id, firstname, lastname, mail, password) values ('$ku_id', '$firstname', '$lastname', '$mail', '$password')");
            
            if($query) {            
                header("Location: register.php?success=true&ku_id=$ku_id&birthdate=$birthdate&academic_level=$academic_level&faculty=$faculty&gender=$gender");
            }
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
        <div class="register-form">
            
            <p>Register</p>
            
            <?php 
                if($registerFailed == true) {
                    echo '<div class="error">This KU Email already taken!</div>';
                }

                if(isset($_GET['success'])) {
                    echo '<div class="success">Your account creation succeed! Please <a href="login.php">Log In</a></div>';
                    $ku_id = $_GET['ku_id'];
                    $birthdate = $_GET['birthdate'];
                    $academic_level = $_GET['academic_level'];
                    $faculty = $_GET['faculty'];
                    $gender = $_GET['gender'];

                    $query2 = $db->query("insert into regular_users (ku_id, academic_level, faculty, gender, birthdate) values ('$ku_id', '$academic_level', '$faculty', '$gender', '$birthdate')");
                }
            ?>

            <form action="register.php" method="post">

                <input type="text" name="ku_id" maxlength="7" placeholder="KU ID" required/>

                <input type="text" name="firstname" placeholder="Firstname" required/>

                <input type="text" name="lastname" placeholder="Lastname" required/>

                <input type="text" name="mail" placeholder="KU Email" required/>

                <input type="password" name="password" placeholder="Password" required/>

                <input type="date" name="birthdate" placeholder="Birthday" required/>

                <select name="academic_level" required>
                    <option value="" disabled selected>Select your academic level</option>
                    <option value="Freshman">Freshman</option>
                    <option value="Sophomore">Sophomore</option>
                    <option value="Junior">Junior</option>
                    <option value="Senior">Senior</option>
                    <option value="Masters">Masters</option>
                    <option value="PhD">PhD</option>
                </select>

                <select name="faculty" required>
                    <option value="" disabled selected>Select your faculty</option>
                    <option value="CASE">CASE</option>
                    <option value="CS">CS</option>
                    <option value="CSSH">CSSH</option>
                    <option value="CE">CE</option>
                    <option value="SOM">SOM</option>
                    <option value="SON">SON</option>
                    <option value="LAW">LAW</option>
                </select>

                <select name="gender" required>
                    <option value="" disabled selected>Select your gender</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="Non-binary">Non-binary</option>
                </select>

                <button type="submit">Sign Up</button>
                
            </form>

            <h1>If you have an account, you can <a href="login.php">Sign In!</a></h1>
        </div>
    </body>
</html>



<style>

    body {
        background: #800000;
        display:flex;
        font-family: sans-serif;
        justify-content: center;
        font-family: Arial, sans-serif;
    }

    form input, form select {
        display: block;
        width: 100%;
        padding: 15px;
        border: none;
        margin-bottom: 10px;
        border-radius: 5px;
        font-size: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    form button {
        border: 1px solid #3498db;
        background: inherit; 
        color: #ffffff; 
        padding: 10px 20px;
        font-size: 20px;
        font-family: 'Poppins', sans-serif;
        cursor: pointer;
        margin: 10px;
    }

    h1 {
        font-size: 16px;
        color: black;
        font-weight: bold;
    }

    p {
        font-size: 25px;
    }

    .register-form {
        max-width: 400px;
        margin: 0 auto;
        background-color: #ffffff;
        border-radius: 8px;
        padding: 30px;
        margin-top: 100px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    .register-form p {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: center;
    }

    .register-form.error {
        color: #ff0000;
        font-size: 10px;
        text-align: center;
        margin-bottom: 20px;
    }


    .register-form button[type="submit"] {
        background-color: #4CAF50;
        color: #ffffff;
        border: none;
        border-radius: 4px;
        padding: 12px 20px;
        font-size: 16px;
        cursor: pointer;
        width: 100%;
    }

    .register-form button[type="submit"]:hover {
        background-color: #45a049;
    }

    .register-form h1 {
        font-size: 16px;
        text-align: center;
        margin-top: 10px;
    }

    .register-form h1 a {
        color: #4CAF50;
        text-decoration: none;
        font-weight: bold;
    }


    .error {
        color: red;
        margin-bottom: 10px;
    }

    .success {
        color: green;
        margin-bottom: 10px;
    }


</style>
