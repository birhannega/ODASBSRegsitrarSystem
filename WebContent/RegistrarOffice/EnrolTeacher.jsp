
<%  
 if(session.getAttribute("registrar")==null)
 {
	 
	 response.sendRedirect("../index.jsp");
 }
 
 else{
 %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>



<!DOCTYPE html>
<html lang="en">
<head>

<title>Enrollments</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="../resources/js/tooltip-viewport.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<%@ include file="../includes/vector.jsp"%>

		</div>
		<div style="margin-top: -18px" class="row">
			<%@ include file="../includes/nav.html"%>
		</div>

		<div class="col-lg-3 col-sm-12 col-md-3">
			<%@ include file="../includes/sidebar.jsp"%>
		</div>
		<div
			class="col-lg-9 col-sm-12 col-md-9 col-sm-12 col-xs-12 pull-right "
			style="margin-left: -12px">
			<%@ include file="home_room_assignment.jsp"%>
		</div>
		<%-- <div class="col-lg-5 col-md-5 pull-right" >
				<%@ include file="Teacher_subject.jsp" %>
			</div> --%>
	</div>
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

</body>
</html>
