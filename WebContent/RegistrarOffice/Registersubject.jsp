<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>

<%
	if (session.getAttribute("registrar") == null) {

		response.sendRedirect("../index.jsp");
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>

<title>Teachers-page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>


</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<%@include file="../includes/vector.jsp"%>
		</div>
		<div style="margin-top: -18px" class="row">
			<%@ include file="../includes/nav.html"%>
		</div>

		<div class="col-lg-3 col-sm-12 col-md-3" style="margin-right: -12px">

			<%@ include file="../includes/sidebar.jsp"%>

		</div>

		<div class="col-lg-9 col-sm-12 col-md-9" style="margin-left: -12px;">

			<%@  include file="CourseRegistration.jsp"%>
		</div>
	</div>
	<div class="footor container col-lg-12 col-md-8 col-sm-12 col-xs-12">

		<p class="text-info well well-sm ">This system is developed by
			volunteer students graduated from Adama science and Technology
			University for Oromiya Development Association</p>

		<%
			Date datee = new Date();
			SimpleDateFormat Sdf = new SimpleDateFormat("YYYY");
			SimpleDateFormat Lsdf = new SimpleDateFormat("MMMM");

			String Ayear = Sdf.format(datee);
			String Month = Lsdf.format(datee);
			out.println("<center>" + "<h5>" + "&copy" + " " + Month + " " + Ayear + "</h5>" + "</center");
		%>

	</div>

</body>
</html>
