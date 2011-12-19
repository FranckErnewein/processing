<!doctype html>
<html>
<head>
	<title>Processing Lab</title>
	<script src="processing-1.3.6.min.js"></script>
	<style>
		
		body{font-family:monospace;color:#333;}
		h1{margin:0;padding:5px 0;height:40px;}
		.links{float:left;padding:50px 10px 0 5px;margin:0;}
		.links a,
		.links span{color:#666;display:inline-block;padding:2px;}
		.links a:hover{background:yellow;color:#333;}
		.links span.current{color:#fff !important;}
		.links a:visited{color:#333;}
		
		.sketch{float:left;}
		.sketch canvas{border:1px solid #333;outline:0 none;}
		
		.src{clear:both;text-align:right;}
		.src a{color:#666;}
	</style>
</head>
<body style="background:#000">
	<p class="links">
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
	<div class="sketch">
		<?php 
			if(isset($_GET['pde'])){
				echo '<h1>'.$_GET['pde'].'</h1>';
				echo '<canvas data-processing-sources="'.$_GET['pde'].'/'.$_GET['pde'].'.pde"></canvas>';
				?><p class="src">source at <a href="https://github.com/FranckErnewein/processing">https://github.com/FranckErnewein/processing</a></p><?php
			}else{
				?><h1>Processing lab</h1><?php
			}
		?>
		
	</div>
	
	
	
	
</body>
</html>