<!doctype html>
<html>
<head>
	<title>Processing Lab</title>
	<script src="processing-1.3.6.min.js"></script>
</head>
<body style="background:#000">
	<?php 
		if(isset($_GET['pde'])){
			echo '<canvas data-processing-sources="'.$_GET['pde'].'/'.$_GET['pde'].'.pde"></canvas>';
		}
	?>
</body>
</html>