<?php 
include "../koneksi/koneksi.php";
error_reporting(0);
session_start();

if (isset($_POST['submit'])) {
    $namaUser = $_POST['NamaUser'];
    $password = md5($_POST['Password']);

    $sql = "SELECT * FROM user WHERE Username='$namaUser' AND Password='$password'";
    $result = mysqli_query($koneksi, $sql);

    if ($result->num_rows > 0) {
        $row = mysqli_fetch_assoc($result);

        //Mengambil informasi Level dari hasil kuaeri//
        $level = $row['level'];
        $_SESSION['level'] = $level;

        $_SESSION['Username'] = $row['Username'];

        header("Location: index.php");        
        echo "<script>alert('Berhasil Masuk!')</script>";
    } else {
        echo "<script>alert('Username atau password Anda salah. Silahkan coba lagi!')</script>";
    }
}
?>      


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>


    <link rel="stylesheet" href="../bootstrap-5.3.2-dist/css/bootstrap.min.css">
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h3 class="">LOGIN</h3>
                    </div>
                    <div class="card-body">
                        <form action="" method="post">
                            <div class="mb-3 mt-3">
                                <label for="" class="form-label">username</label>
                                <input type="text" name="NamaUser" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="" class="form-label">password</label>
                                <input type="password" name="Password" class="form-control">
                            </div>
                            <button name="submit" class="btn btn-primary">login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
                    <script src="../bootstrap//bootstrap.min.js"></script>
                    <script src="../bootstrap/jquery.min.js"></script>


</body>
</html>