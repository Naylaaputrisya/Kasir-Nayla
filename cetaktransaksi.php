<?php
include("header.php");
?>
      <body>
        
        <div class="p-4 col-6">
          <div class="card mt-5">
            <div class="card-body">
            <table class="table table-bordered">
		<thead>
			<tr>
				<th>No</th>
				<th>Tanggal Transaksi</th>
                <th>Nama Pemesan</th>
				<th>Menu</th>	
			</tr>
		</thead>
		<tbody>
        <?php
            include("koneksi/koneksi.php");

            $query = "SELECT Penjualan_id, Tanggal_Penjualan FROM penjualan ORDER BY Penjualan_id DESC LIMIT 1";
            $result = mysqli_query($koneksi, $query);
            
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>" . $row['Penjualan_id'] . "</td>";
                echo "<td>" . $row['Tanggal_Penjualan'] . "</td>";
                ?>
                <td>
                  <?php
                  $query1 = "SELECT Nama_Pelanggan FROM pelanggan WHERE Pelanggan_id = '".$row['Penjualan_id']."'";
                  $result1 = mysqli_query($koneksi, $query1);
                  
                  while ($row1 = mysqli_fetch_assoc($result1)) {
                    echo $row1['Nama_Pelanggan'];
                  }
                  ?>
                </td>
                <td>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Nama Produk</th>
                                <th class="col-1">Jumlah</th>
                                <th class="col-1">Harga</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                            // Fetch details for the current Penjualan
                            $query2 = "SELECT Produk_id, Penjualan_id, Jumlah_Produk, Subtotal FROM detail_penjualan WHERE Detail_id = '" . $row['Penjualan_id'] . "'";
                            $result2 = mysqli_query($koneksi, $query2);

                            // Inisialisasi total harga
                            $totalHarga = 0;

                            while ($detailrow = mysqli_fetch_assoc($result2)) {
                                echo "<tr>";
                                
                                // Fetch NamaProduk
                                $query3 = "SELECT Nama_Produk FROM produk WHERE Produk_id = '" . $detailrow['Produk_id'] . "' ";
                                $result3 = mysqli_query($koneksi, $query3);

                                while ($row2 = mysqli_fetch_assoc($result3)) {
                                    echo "<td>" . $row2['Nama_Produk'] . "</td>";
                                }

                                echo "<td>" . $detailrow['Jumlah_Produk'] . " Pcs</td>";
                                echo "<td>RP." . $detailrow['Subtotal'] . "</td>";
                                echo "</tr>";

                                // Tambahkan Subtotal ke total harga
                                $totalHarga += $detailrow['Subtotal'];
                            }

                            // Menampilkan total harga di luar loop
                            echo "<tr>";
                            echo "<td colspan='2'><strong>Total Harga:</strong></td>";
                            echo "<td colspan='2'><strong>RP." . $totalHarga . ",00</strong></td>";
                            echo "</tr>";
                        ?>
                            
                        </tbody>
                    </table>
                </td>
                <?php
                echo "</tr>";
              }
              
        ?>
		</tbody>
	</table>
            </div>
          </div>
        </div>
      </body>
      
      <script>
        window.print()
      </script>