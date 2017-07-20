<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Super Administrator panel</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.css" />
</head>
<script type="text/javascript">
function getdata() {
	var xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
	if(xmlhttp.readyState==4 && xmlhttp.status==200)
		{
		var responsedata=document.getElementById('data');
		responsedata.innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open('GET','hello.jsp',true);
	xmlhttp.send();
}


</script>
<body>
	<div class="container" style="margin-top: 10px">
		<button class="btn btn-primary">Add student</button>
		<button onclick="getdata()" class="btn btn-primary">Get
			Active Student List</button>
		<div id="data" class="container"></div>

	</div>


</body>
</html>