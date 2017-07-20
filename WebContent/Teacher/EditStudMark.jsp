
<%
if(session.getAttribute("user")==null)
{
	response.sendRedirect("../index.jsp");
	
}
else
{
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit student mark</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/print.css" media="print">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
</head>
<body>
	<div class="container-fluid">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="text-left text-uppercase">ODA Special boarding
					school student Record Management System</h3>
			</div>
		</div>

		<div class="col-lg-3">
			<%@include file="../includes/Tsidebar.jsp"%>
		</div>
		<div class="col-lg-9">
			<%@include file="Markeditor.jsp"%>
		</div>
	</div>
	<%} %>
</body>
</html>