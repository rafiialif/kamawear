<?php
include "inc/config.php";
include "layout/header.php";

error_reporting(0);
?>
<?php if (!empty($_GET['id'])) { ?>
	<?php
	extract($_GET);
	$k = mysqli_query($db, "SELECT * FROM produk where id='$id'");
	$data = mysqli_fetch_array($k);
	?>
	<div class="col-md-9">
		<div class="row">
			<div class="col-md-12">
				<h3>Detail : <?php echo $data['nama'] ?></h3>
				<br />
				<div class="col-md-12 content-menu" style="margin-top:-20px;">
					<?php $kat = mysqli_fetch_array(mysqli_query($db, "SELECT * FROM kategori_produk where id='$data[kategori_produk_id]'"));  ?>
					<small>Kategori :<a href="<?php echo $url; ?>menu.php?kategori=<?php echo $kat['id'] ?>"><?php echo $kat['nama'] ?></a></small>
					<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>">

						<img src="<?php echo $url; ?>uploads/<?php echo $data['gambar'] ?>" width="100%">
					</a>
					<br><br>
					<p><?php echo $data['deskripsi'] ?></p>
					<p style="font-size:18px">Harga :<?php echo number_format($data['harga'], 2, ',', '.') ?></p>
					<p>
						<a href="<?php echo $url; ?>keranjang.php?act=beli&&produk_id=<?php echo $data['id'] ?>" class="btn btn-info" href="#" role="button">Pesan</a>
					</p>
				</div>



			</div>
		</div>
	</div>

<?php } elseif (!empty($_GET['kategori'])) { ?>

	<?php
	extract($_GET);
	$kat = mysqli_fetch_array(mysqli_query($db, "SELECT * FROM kategori_produk where id='$kategori'"));
	?>
	<div class="col-md-9">
		<div class="row">
			<div class="col-md-12">
				<hr>
				<h3>Kategori : <?php echo $kat['nama'] ?></h3>
				<?php
				$k = mysqli_query($db, "SELECT * FROM produk where kategori_produk_id='$kategori'");
				while ($data = mysqli_fetch_array($k)) {
				?>
					<div class="col-md-4 content-menu">
						<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>">
							<img src="<?php echo $url; ?>uploads/<?php echo $data['gambar'] ?>" width="100%">
							<h4><?php echo $data['nama'] ?></h4>
						</a>
						<p style="font-size:18px">Harga :<?php echo number_format($data['harga'], 2, ',', '.') ?></p>
						<p>
							<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>" class="btn btn-success btn-sm" href="#" role="button">Lihat Detail</a>
							<a href="<?php echo $url; ?>keranjang.php?act=beli&&produk_id=<?php echo $data['id'] ?>" class="btn btn-info btn-sm" href="#" role="button">Pesan</a>
						</p>
					</div>
				<?php } ?>

			</div>
		</div>
	</div>

<?php } else { ?>

	<?php $k = mysqli_query($db, "SELECT * FROM produk");
	if (isset($_POST["cari"])) {
		$k = cari($_POST["keyword"]);
	}

	?>

	<div class="col-md-9">
		<div class="row">
			<div class="col-md-12">
				<form action="" method="post">
					<input type="text" name="keyword" id="" placeholder="Masukkan Pencarian">
					<button type="submit" name="cari">Search</button>
				</form>
				<hr>
				<h3>Daftar Semua Produk</h3>
				<?php

				$k = $_POST['keyword'];
				if ($k != '') {
					$select = mysqli_query($db, "SELECT * FROM produk WHERE 
					nama LIKE '%" . $k . "%' OR
					deskripsi LIKE '%" . $k . "%' OR
					harga LIKE '%" . $k . "%'
					
					");
				} else {
					$select = mysqli_query($db, "SELECT * FROM produk");
				}
				if (mysqli_num_rows($select)) {
					while ($data = mysqli_fetch_array($select)) {
				?>
						<div class="col-md-4 content-menu">
							<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>">
								<img src="<?php echo $url; ?>uploads/<?php echo $data['gambar'] ?>" width="100%">
								<h4><?php echo $data['nama'] ?></h4>
							</a>
							<p style="font-size:18px">Harga :<?php echo number_format($data['harga'], 2, ',', '.') ?></p>
							<p>
								<a href="<?php echo $url; ?>menu.php?id=<?php echo $data['id'] ?>" class="btn btn-success btn-sm" href="#" role="button">Lihat Detail</a>
								<a href="<?php echo $url; ?>keranjang.php?act=beli&&produk_id=<?php echo $data['id'] ?>" class="btn btn-info btn-sm" href="#" role="button">Pesan</a>
							</p>
						</div>
				<?php }
				} else {
					echo "<h1>Hasil Pencarian Tidak Ditemukan</h1>";
				} ?>

			</div>
		</div>
	</div>

<?php } ?>
<?php include "layout/footer.php"; ?>