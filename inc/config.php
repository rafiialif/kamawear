<?php
date_default_timezone_set('Asia/Jakarta');
session_start();
$db = mysqli_connect("localhost", "root", "", "clothing") or die("Database tidak bisa dibuka " . mysqli_connect_error());
// settings
$url = "http://localhost/clothing/";
$title = "Website Kama Store";
$no = 1;

function alert($command)
{
	echo "<script>alert('" . $command . "');</script>";
}
function redir($command)
{
	echo "<script>document.location='" . $command . "';</script>";
}
function validate_admin_not_login($command)
{
	if (empty($_SESSION['iam_admin'])) {
		redir($command);
	}
}

function cari($keyword)
{
	global $db;
	$query = "SELECT * FROM produk
			WHERE 
			nama ='$keyword'
		";
	return mysqli_query($db, $query);
}
