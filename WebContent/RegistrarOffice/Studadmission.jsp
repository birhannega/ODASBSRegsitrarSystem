<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Management</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
</head>
<body>
	<div class="container-fluid">

		<div class="row">
			<%@include file="../includes/vector.jsp"%>
		</div>
		<div class=""
			style="margin-top: -20px; margin-left: -12px; margin-right: -12px">
			<%@ include file="../includes/nav.html"%>
		</div>
		<div class="container-fluid" style="margin-top: -15px">



			<div class=" container-fluid col-lg-3 col-md-3"
				style="margin-left: -12px">
				<%@ include file="../includes/sidebar.jsp"%>
			</div>
			<div class="col-lg-9 col-md-9">
				<%@ include file="Re-Admission.jsp"%>
			</div>
		</div>
	</div>



</body>
</html>