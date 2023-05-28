<?php
    session_start();
    include "config.php";

    if (!isset($_SESSION['ku_id'])) {
        header('Location: login.php');
    }
?>


<script>

  function redirectToPage(pageName) {
    var form = document.querySelector('form');
    form.action = pageName + ".php";
    form.susbmit();
  }

</script>


<!DOCTYPE html>
<html>
    <body>
        <section class="sec">
            <header>

                <a href="#">
                    <img src="../src/koc.png" class="logo">
                </a>
            
                <form id ="form" method="POST" >
                    <button class="button" onclick="redirectToPage('homepage')"> Home </button>
                    <button class="button" onclick="redirectToPage('findclass')">Class Search </button>
                    <button class="button" onclick="redirectToPage('reservation')">Reserve Class </button>
                    <button class="button" onclick="redirectToPage('logout')"> Logout </button>
                </form>  

            </header>
        </section>
    </body>
</html>


<style>

    .button-container {
    text-align: center;
    }

    .study-room-selector {
    padding: 10px;
    font-size: 18px;
    border: none;
    background-color: #f1f1f1;
    color: #555;
    border-radius: 10px;
    width: 250px;
    margin-bottom: 10px;
    }

    .search-button {
    padding: 12px 24px;
    font-size: 20px;
    border: none;
    background-color: #4CAF50;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    }

    .search-button:hover {
    background-color: #45a049;
    }
    
    .login-form {
    max-width: 400px;
    margin: 0 auto;
    background-color: #ffffff;
    border-radius: 8px;
    padding: 40px;
    margin-top: 100px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    .login-form p {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
    text-align: center;
    }

    .login-form .error {
    color: #ff0000;
    font-size: 14px;
    text-align: center;
    margin-bottom: 10px;
    }



    .login-form input[type="text"],
    .login-form input[type="password"] {
    width: 100%;
    padding: 12px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    }

    .login-form button[type="submit"] {
    background-color: #4CAF50;
    color: #ffffff;
    border: none;
    border-radius: 4px;
    padding: 12px 20px;
    font-size: 16px;
    cursor: pointer;
    width: 100%;
    }

    .login-form button[type="submit"]:hover {
    background-color: #45a049;
    }

    .login-form h1 {
    font-size: 16px;
    text-align: center;
    margin-top: 20px;
    }

    .login-form h1 a {
    color: #4CAF50;
    text-decoration: none;
    font-weight: bold;
    }



    body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    margin: 0;
    padding: 0;
    background: #800000;
    }


    header {
    background: #800000;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    }

    header .logo {
    max-width: 80px;
    }


    main {
    flex-grow: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    background: inherit;
    }

    .button {
    border: 1px solid #3498db;
    background: inherit; 
    color: #ffffff; 
    padding: 10px 20px;
    font-size: 20px;
    font-family: 'Poppins', sans-serif;
    cursor: pointer;
    margin: 10px;
    }

</style>
