<?php
    include "config.php";
    include "header.php";
?>


<!DOCTYPE html>
<html>
    <body>
        <section class="sec">
            <div class="content">
                <div class="textBox">
                    <h2>
                        Need a place to <br><span> study? </span></h2>
                    </h2>
                </div>
            </div>
        </section>
    </body>
</html>


<style>

    .content {
        position: relative;
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .content .textBox {
        position: relative;
        max-width: 600px;
    }
    .content .textBox h2 {
        color: #fff;
        font-size: 4em;
        line-height: 1.5em;
        font-weight: 900;
        text-transform: uppercase;
    }
    .content .textBox h2 span {
        font-size: 2em;
    }
    .content .textBox p {
        color: #fff;
    }
    .content .textBox a {
        display: inline-block;
        margin-top: 20px;
        padding: 8px 20px;
        background: #fff;
        color: #111;
        border-radius: 40px;
        font-weight: 500;
        letter-spacing: 1px;
        text-decoration: none;
        text-transform: uppercase;
    }

</style>

