<?php

include_once("../koneksi/koneksi.php");

if (isset($_POST['update'])) {
    $id = $_GET['Produk_id'];

    $Nama_produk = $_POST['Nama_produk'];
    $Harga = $_POST['Harga'];
    $Stok = $_POST['Stok'];

    $result = mysqli_query($koneksi, "UPDATE produk SET Nama_produk='$Nama_produk', Harga='$Harga', Stok='$Stok' WHERE Produk_id=$id");

    header("Location: index.php?page=Stok");
    echo "<script>alert('Berhasil')</script>";
}

$id = $_GET['Produk_id'];

$result1 = mysqli_query($koneksi, "SELECT * FROM produk WHERE Produk_id=$id");

while ($barang_data = mysqli_fetch_array($result1)) {
    $Nama_produk = $barang_data['Nama_Produk'];
    $Harga = $barang_data['Harga'];
    $Stok = $barang_data['Stok'];
}
?>

<div class="row well">
    <div class="col-md-4">
        <div class="card well">
            <div class="card-header">
                <h3 class="">Update barang</h3>
            </div>
            <div class="card-body">
                <form action="" method="POST">
                <div class="mb-3 mt-3">
                        <label for="nama" class="form-label">Nama Produk:</label>
                        <input type="text" class="form-control" id="Nama_produk" value="<?php echo $Nama_produk; ?>" placeholder="Masukkan Nama" name="Nama_produk">
                    </div>
                    <div class="mb-3">
                        <label for="harga" class="form-label">Harga:</label>
                        <input type="text" class="form-control" id="Harga" value="<?php echo $Harga; ?>" placeholder="Masukkan Harga" name="Harga">
                    </div>
                    <div class="mb-3">
                        <label for="stok" class="form-label">Stok:</label>
                        <input type="text" class="form-control" id="Stok" value="<?php echo $Stok; ?>" placeholder="Masukkan Stok" name="Stok">
                    </div>

                    <button type="submit" name="update" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>