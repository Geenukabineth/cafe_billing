<!DOCTYPE html>
<html lang="en">
<?php 
session_start();
include('./db_connect.php');
ob_start();

	$system = $conn->query("SELECT * FROM system_settings limit 1")->fetch_array();
	foreach($system as $k => $v){
		$_SESSION['system'][$k] = $v;
	}
// }
ob_end_flush();
?>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title><?php echo $_SESSION['system']['name'] ?></title>

<?php include('./header.php'); ?>
<?php 
if(isset($_SESSION['login_id']))
header("location:index.php?page=home");
?>

<style>
	body {
		width: 100%;
		height: 100vh;
		margin: 0;
		display: flex;
		justify-content: center;
		align-items: center;
		background: url('/cafe_billing/Source Images/cafe_login_img.jpg') no-repeat center center fixed;
		background-size: cover;
		font-family: Arial, sans-serif;
		color: white;
	}

	main#main {
		width: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		color: white;
	}

	#login-center {
		width: 100%;
		max-width: 400px;
		padding: 20px;
		background: rgba(0, 0, 0, 0.7); 
		border-radius: 10px;
		box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
		backdrop-filter: blur(10px);
	}

	.form-group label {
		font-weight: bold;
		color: white;
	}

	.form-control {
		margin-bottom: 10px;
		border-radius: 5px;
		border: none;
		padding: 10px;
		background: rgba(255, 255, 255, 0.8);
		color: black;
	}

	.form-control:focus {
		outline: none;
		box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
	}

	.btn-primary {
		background: #007bff;
		border: none;
		border-radius: 5px;
		padding: 10px;
		color: white;
		cursor: pointer;
	}

	.btn-primary:hover {
		background: #0056b3;
	}

	.text-white {
		color: white !important;
	}

	.alert-danger {
		margin-bottom: 10px;
		background: rgba(255, 0, 0, 0.7);
		color: white;
		border: none;
		border-radius: 5px;
		padding: 10px;
	}

	.back-to-top {
		position: fixed;
		bottom: 20px;
		right: 20px;
		display: none;
		background: #007bff;
		color: white;
		padding: 10px 15px;
		border-radius: 50%;
		cursor: pointer;
	}

	.back-to-top:hover {
		background: #0056b3;
	}
</style>

</head>

<body>

<main id="main">
	<h1 class="text-center" style="color: white; background: rgba(0, 0, 0, 0.7); padding: 10px 20px; border-radius: 10px;"><b><?php echo $_SESSION['system']['name'] ?></b></h1>
	<div id="login-center">
		<form id="login-form">
			<div class="form-group">
				<label for="username" class="control-label">Username</label>
				<input type="text" id="username" name="username" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="password" class="control-label">Password</label>
				<input type="password" id="password" name="password" class="form-control" required>
			</div>
			<center><button type="submit" class="btn btn-primary btn-block">Login</button></center>
		</form>
	</div>
</main>

<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$('#login-form').submit(function(e){
		e.preventDefault();
		$('#login-form button[type="submit"]').attr('disabled', true).html('Logging in...');
		if($(this).find('.alert-danger').length > 0 )
			$(this).find('.alert-danger').remove();
		$.ajax({
			url: 'ajax.php?action=login',
			method: 'POST',
			data: $(this).serialize(),
			error: err => {
				console.log(err);
				$('#login-form button[type="submit"]').removeAttr('disabled').html('Login');
			},
			success: function(resp){
				if(resp == 1){
					location.href = 'index.php?page=home';
				}else{
					$('#login-form').prepend('<div class="alert alert-danger">Username or password is incorrect.</div>');
					$('#login-form button[type="submit"]').removeAttr('disabled').html('Login');
				}
			}
		});
	});
</script>

</body>
</html>
