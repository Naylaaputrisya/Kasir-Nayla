<?php
$server = "localhost";
$user = "root";
$password = "";
$database = "kasirr";

$koneksi = new mysqli ($server, $user, $password, $database);

if (!$koneksi) {
    die("<script>alert('Tidak terhubung dengan databaase')</script>");
}
?>