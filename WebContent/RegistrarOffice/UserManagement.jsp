
<%  
 if(session.getAttribute("registrar")==null)
 {
	 response.sendRedirect("../index.jsp");
 }
 else
 {
 %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>user management</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />


</head>
<body style="font-family: Trebuchet MS, sans-serif;">
	<div class="container-fluid">

		<div>
			<%@include file="../includes/vector.jsp"%>
		</div>


		<div class="container-fluid"
			style="margin-left: -12px; margin-top: -18px">
			<%@ include file="../includes/nav.html"%>
		</div>

		<div class="row container-fluid"
			style="margin-left: -10px; margin-top: -18px">
			<div class="col-md-3 col-lg-3">
				<%@ include file="../includes/sidebar.jsp"%>
			</div>
			<div class="col-md-5 col-lg-5">
				<div>
					<%@ include file="blockUser.jsp"%>
				</div>

				<%@ include file="ActivateUser.jsp"%>
			</div>
			<div class="col-md-4 col-lg-4">
				<%@ include file="Useraccunts.jsp"%>
			</div>
		</div>


	</div>
	<script type="text/javascript"
		src="../resources/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>

	<div class="footor container col-lg-12 col-md-8 col-sm-12 col-xs-12">

		<p class="text-info well well-sm ">This system is developed by
			volunteer students graduated from Adama science and Technology
			University for Oromiya Development Association</p>

		<%
 }
Date date=new Date(); 
SimpleDateFormat sdf=new SimpleDateFormat("YYYY");
		SimpleDateFormat lsdf=new SimpleDateFormat("MMMM");

String year=sdf.format(date);
String month=lsdf.format(date);
out.println("<center>"+"<h5>"+"&copy"+" "+month+" "+year+"</h5>"+"</center");

%>

	</div>
	<script type="text/javascript"
		src="../resources/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
