<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>
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

	<div class="footor container col-lg-12 col-md-8 col-sm-12 col-xs-12">

		<p class="text-info well well-sm ">This system is developed by
			volunteer students graduated from Adama science and Technology
			University for Oromiya Development Association</p>

		<%
 
Date date=new Date(); 
SimpleDateFormat sdf=new SimpleDateFormat("YYYY");
		SimpleDateFormat lsdf=new SimpleDateFormat("MMMM");

String year=sdf.format(date);
String month=lsdf.format(date);
out.println("<center>"+"<h5>"+"&copy ODASBS"+" "+month+" "+year+"</h5>"+"</center");

%>

	</div>



</body>
</html>