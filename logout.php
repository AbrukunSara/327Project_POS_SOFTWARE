<?php
  session_start(); //to ensure that using the same session
  require 'function.php';
  session_destroy(); //destroy the session
  header('Location: index.php');
  exit();
 ?>
