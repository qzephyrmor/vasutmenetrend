<?php
//include 'core/init.php';
include_once ('core/database/connect.php');
include_once 'includes/overall/header.php';
include_once 'includes/overall/footer.php';
$message = "";
if(isset($_POST['send'])){
    $jelszo = htmlspecialchars($_POST['password']);
    $username = htmlspecialchars($_POST['username']);

    $stid = oci_parse($conn, "SELECT NEVE, JELSZO FROM FELHASZNALO WHERE NEVE LIKE '" . $username ."'");

    if (!$stid) {
        $e = oci_error($conn);
        trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
    }

    $r = oci_execute($stid);

    if (!$r) {
        $e = oci_error($stid1);
        trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
    }

    $stmt= oci_parse($conn, "SELECT COUNT(NEVE) AS NUMBER_OF_ROWS FROM FELHASZNALO WHERE NEVE LIKE '" . $username ."'");
    oci_define_by_name($stmt, 'NUMBER_OF_ROWS', $number_of_rows);
    oci_execute($stmt);
    oci_fetch($stmt);



    if ($username != "" && $jelszo != "") {
        if ($number_of_rows == '0'){
            $message = "A felhasználó nem létezik!";
        } else {
            $row = oci_fetch_assoc($stid);
            if ($jelszo != $row['JELSZO']){
                $message = "A megadott jelszó nem helyes!";
            } else {
                $_SESSION['login'] = true;
                $_SESSION['login_name'] = $row['NEVE'];
                $_POST = array();
                header("Location: index.php");
            }
        }
    }
    $_POST = array();
     if ($message != ""){
         echo $message;
}}
?>
<div  class="widget">
    <?php if ($message != ""){?>
        <p><?php echo $message;?></p>
        <?php
    }
    ?><div class="inner">
        <form method="post" action="index.php">
            Username:<input type="text" name="username" value="" maxlength="20"><br>
            Password:<input type="password" name="password" value="" maxlength="20"><br>
            <input type="submit" name="send" value="Bejelentkezés"/>
        </form>
    </div>
    <a href="signup.php">Regisztráció</a>
</div>