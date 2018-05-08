
    <?php
    $tns = "
(DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 4000))
    )
    (CONNECT_DATA =
      (SID = kabinet)
    )
  )";
    $db_username = "h461371";
    $db_password = "h461371";
    $conn = oci_connect($db_username,$db_password,$tns,'UTF8') or die();

if (!$conn) {
    $e = oci_error();
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
    }

    ?>
