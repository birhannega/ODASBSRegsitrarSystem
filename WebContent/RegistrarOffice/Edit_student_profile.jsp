
<%if(session.getAttribute("registrar")==null)
	{
	response.sendRedirect("../index.jsp");
	}
	else
	{%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<title>Edit profile</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="container-fluid">
				<div><%@ include file="../includes/vector.jsp"%></div>
				<div style="margin-top: -18px">
					<%@ include file="../includes/nav.html"%></div>
			</div>
		</div>
	</div>

	<div class="container-fluid" style="margin-left: 12px;">
		<div class="col-sm-12 col-xs-12 col-md-3 col-lg-3">
			<%@include file="../includes/sidebar.jsp"%>
		</div>
		<div class="col-md-9 col-lg-9 col-sm-12 col-xs-12">
			<%@include file="EditStudentProfile.jsp"%>
		</div>
	</div>
</body>
</html>
<%}%>