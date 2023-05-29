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
                    <button class="button" onclick="redirectToPage('classSearch')">Class Search </button>
                    <button class="button" onclick="redirectToPage('reservation')">Reserve Class </button>
                    <select name="profile_selector" required>

                        <option class="button" value="profile">Profile</option>
                        <option class="button" value="profile" onkeypress="redirectToPage('profile_settings')">Settings</option>
                        <option class="button" value="favorites" onkeypress="redirectToPage('fav_classes')">Favorites</option>
                        <option class="button" value="logout" onblur="redirectToPage('logout')">Logout</option>
                    </select>
                </form>  

            </header>
        </section>
    </body>
</html>


<style>

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
    background: #45a049; 
    color: #ffffff; 
    padding: 10px 20px;
    font-size: 20px;
    font-family: 'Poppins', sans-serif;
    cursor: pointer;
    margin: 10px;
    border-radius: 5px;
    }

</style>
