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
		<div style="margin: 2px -14px 0 -16px;">
			<%@ include file="../includes/vector.jsp"%>
		</div>
		<div class="row" style="margin: -20px -14px 0 -16px;">
			<%@ include file="../includes/nav.html"%>
		</div>
	</div>
	<div class="container-fluid"
		style="margin-left: 8px; margin-top: -15px">
		<div class="col-lg-3 col-md-3">
			<%@ include file="../includes/sidebar.jsp"%>
		</div>
		<div class="col-lg-9 col-md-9">
			<%@ include file="withdraw.jsp"%>
		</div>
	</div>


</body>
</html>