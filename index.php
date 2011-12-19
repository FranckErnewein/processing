<!doctype html>
<html>
<head>
	<title>Processing Lab</title>
	<script src="processing-1.3.6.min.js"></script>
	<style>
		canvas{float:left;border:1px solid #333;outline:0 none;}
		body{font-family:monospace;color:#333;}
		.links{float:left;padding:5px;}
		.links a,
		.links span{color:#666;display:inline-block;padding:2px;}
		.links a:hover{background:yellow;color:#333;}
		.links span.current{color:#fff !important;}
		.links a:visited{color:#333;}
	</style>
</head>
<body style="background:#000">
	<p class="links">
	<br /><br />
	<?php 
		$dir_nom = './';
		$dir = opendir($dir_nom);
		while($element = readdir( $dir ) ) {
			if($element[0] != '.' ) {
				if (is_dir($dir_nom.'/'.$element)) {
					if( isset($_GET['pde']) && $_GET['pde'] == $element){
						echo '<span class="current" href="?pde='.$element.'">'.$element.'</span><br />';
					}else{
						echo '<a href="?pde='.$element.'">'.$element.'</a><br />';
					}
				}
				
			}
		}
	
	?>
	</p>
	
	<?php 
		if(isset($_GET['pde'])){
			echo '<h1>'.$_GET['pde'].'</h1>';
			echo '<canvas data-processing-sources="'.$_GET['pde'].'/'.$_GET['pde'].'.pde"></canvas>';
		}else{
		
		}
	?>
	
	
</body>
</html>