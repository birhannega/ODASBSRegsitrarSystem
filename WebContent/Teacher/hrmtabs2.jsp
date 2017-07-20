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



	<div id="tabs" class="panel-default">
		<ul class="panel panel-heading">
			<li><a href="#tabs-1">Prepare Mark List</a></li>
			<li><a href="#tabs-2">Students conduct Evaluation</a></li>
		</ul>
		<div class="panel-body">
			<div id="tabs-1">
				<p class="page-header" style="margin-top: -12px">
					<strong> Update Mark of students of your Room</strong>
				</p>

				<a href="Markform.jsp">Click here to update marklist</a>
			</div>
			<div id="tabs-2">
				<%@include file="conduct.jsp"%>
			</div>

		</div>
	</div>


	<!--div id="datepicker"></div-->





	<script src="../external/jquery/jquery.js"></script>
	<script src="jquery-ui.js"></script>
	<script>





$( "#tabs" ).tabs();






$( "#datepicker" ).datepicker({
	inline: true
});




</script>
</body>
</html>
