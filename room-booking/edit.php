<?php

    if(!isset($_SESSION))  { 
        session_start(); 
    } 

    include "header.php";
    include "config.php"
?>


<?php
    $current_id = $_SESSION['ku_id'];
    $sql = "SELECT u.*, r.academic_level, r.faculty
            FROM users u
            JOIN regular_users r ON u.ku_id = r.ku_id
            WHERE u.ku_id = '$current_id'";

    $result = mysqli_query($db, $sql);

    if ($result) {
        if (mysqli_num_rows($result) > 0) {

            $row = mysqli_fetch_assoc($result);

            if(isset($_POST['update_user'])){
                $firstname = $_POST['name'];
                $lastname = $_POST['lastname'];
                $password = $_POST['password'];
                $academic_level = $_POST['academic_level'];
                $faculty = $_POST['faculty'];

                $sql2 = "UPDATE users SET firstname = '$firstname', lastname = '$lastname', password = '$password' WHERE ku_id = '$current_id'";
                $result2 = mysqli_query($db, $sql2);

                $sql3 = "UPDATE regular_users SET academic_level = '$academic_level', faculty = '$faculty' WHERE ku_id = '$current_id'";
                $result3 = mysqli_query($db, $sql3);

                if($result2 || $result3){
                    echo "<script>alert('Profile updated successfully!')</script>";
                    echo "<script>window.open('edit.php','_self')</script>";
                } else{
                    echo "<script>alert('Profile update failed!')</script>";
                    echo "<script>window.open('edit.php','_self')</script>";
                }
                       
            }   
        
?>


<form action="edit.php" method="post">
            <div class="container">
                <h2>Edit Profile</h2>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" name="name" class="form-control"
                           value="<?php echo $row['firstname']; ?>">
                </div>
                <div class="form-group">
                    <label for="lastname">Surname:</label>
                    <input type="text" name="lastname" class="form-control"
                           value="<?php echo $row['lastname']; ?>">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" name="email" class="form-control"
                           value="<?php echo $row['mail']; ?>" disabled>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="text" name="password" class="form-control"
                           value="<?php echo $row['password']; ?>">
                </div>
                <div class="form-group">
                    <label for="ku_id">KU ID:</label>   
                    <input type = "text" name="ku_id" class="form-control"
                           value="<?php echo $row['ku_id']; ?>" disabled>
                </div>
                <div class="form-group">
                    <label for="academic_level">Academic Level:</label>
                    <select name="academic_level" class="form-control">
                        <option value="" disabled selected>Select your academic level</option>
                        <option value="Freshman" <?php echo ($row['academic_level'] == 'Freshman') ? 'selected' : ''; ?>>
                            Freshman
                        </option>
                        <option value="Sophomore" <?php echo ($row['academic_level'] == 'Sophomore') ? 'selected' : ''; ?>>
                            Sophomore
                        </option>
                        <option value="Junior" <?php echo ($row['academic_level'] == 'Junior') ? 'selected' : ''; ?>>
                            Junior
                        </option>
                        <option value="Senior" <?php echo ($row['academic_level'] == 'Senior') ? 'selected' : ''; ?>>
                            Senior
                        </option>
                        <option value="Masters" <?php echo ($row['academic_level'] == 'Masters') ? 'selected' : ''; ?>>
                            Masters
                        </option>
                        <option value="PhD" <?php echo ($row['academic_level'] == 'PhD') ? 'selected' : ''; ?>>
                            PhD
                        </option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="faculty">Faculty:</label>
                    <select name="faculty" class="form-control">
                        <option value="" disabled selected>Select your faculty</option>
                        <option value="CASE" <?php echo ($row['faculty'] == 'CASE') ? 'selected' : ''; ?>>CASE</option>
                        <option value="CS" <?php echo ($row['faculty'] == 'CS') ? 'selected' : ''; ?>>CS</option>
                        <option value="CSSH" <?php echo ($row['faculty'] == 'CSSH') ? 'selected' : ''; ?>>CSSH</option>
                        <option value="CE" <?php echo ($row['faculty'] == 'CE') ? 'selected' : ''; ?>>CE</option>
                        <option value="SOM" <?php echo ($row['faculty'] == 'SOM') ? 'selected' : ''; ?>>SOM</option>
                        <option value="SON" <?php echo ($row['faculty'] == 'SON') ? 'selected' : ''; ?>>SON</option>
                        <option value="LAW" <?php echo ($row['faculty'] == 'LAW') ? 'selected' : ''; ?>>LAW</option>
                    </select>
                </div>
                <div class="form-group">
                    <button type="submit" name="update_user">Update </button>
            <?php  
              
        }
    }
            ?>


</form>  
   
<style>
    body {
        background-color: #800000;
        font-family: Arial, sans-serif;
    }

    .container {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .container h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
    }

    .form-group input {
        display: block;
        width: 93%;
        padding: 10px;
        border: none;
        margin-bottom: 10px;
        border-radius: 5px;
        font-size: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .form-group select {
        display: block;
        width: 93%;
        padding: 10px;
        border: none;
        margin-bottom: 10px;
        border-radius: 5px;
        font-size: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }


    .form-group button {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #45a049;
        color: #fff;
        font-size: 16px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }
    

</style>