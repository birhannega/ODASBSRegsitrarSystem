<!doctype html>
<html lang="us">
<head>

<title>room</title>
<link href="jquery-ui.css" rel="stylesheet">
<style>
body {
	font-family: "Trebuchet MS", sans-serif;
}
</style>
</head>
<body>

	<div class="col-md-12">

		<div id="tabs" class="panel-default">
			<ul class="panel panel-heading">
				<li><a href="#tabs-1">Prepare Roaster</a></li>
				<li><a href="#tabs-2">Prepare Mark List</a></li>

			</ul>
			<div class="panel-body">
				<div id="tabs-1">
					<h4 class="page-header text-uppercase" style="margin-top: 2px;">Roaster
						preparation</h4>
					<h5>
						<a href="Roaster.jsp" style="color: blue; font: bold">prepare
							Roaster for your room</a>
					</h5>


				</div>
				<div id="tabs-2">
					<h4 class="page-header text-uppercase" style="margin-top: 2px;">Mark
						List preparation</h4>
					<h5>
						<a href="Report_mark.jsp" style="color: blue; font: bold">prepare
							marklist for your room</a>
					</h5>
				</div>

			</div>
		</div>








		<script src="../external/jquery/jquery.js"></script>
		<script src="jquery-ui.js"></script>
		<script>





$( "#tabs" ).tabs();






$( "#datepicker" ).datepicker({
	inline: true
});




</script>
	</div>
</body>
</html>
