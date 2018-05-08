<?php
session_start();
include_once 'includes/overall/header.php';
include_once 'includes/overall/footer.php';
include_once ('core/database/connect.php');
if (isset($_GET['logout'])){
    unset($_SESSION['login']);
    unset($_SESSION['login-name']);
    unset($_SESSION['message']);
}
if (!isset($_SESSION['login'])){
    $_SESSION['login'] = false;
}

    ?>
<head>

</head>
<body>
<?php
if($_SESSION['login']) {
    $user = $_SESSION['login_name'];
    echo "You have logged in as: " . $_SESSION['login_name'];
    if (isset($_SESSION['message'])) {
        echo "<script type='text/javascript'>alert('Failed to upload!')</script>";
        unset($_SESSION['message']);
    }
}

?>








<?php





oci_close($conn);
?>
</body>
</html>