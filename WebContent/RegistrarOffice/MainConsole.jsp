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

<title>Main console</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>

</head>
<body style="font-family: Trebuchet MS, sans-serif;">
 <div class="container-fluid">
 
		<div class="row">
	<%@include file="../includes/vector.jsp" %>
	</div>
		
		
		<div class="row" style="margin-top: -20px">
		<%@ include file="../includes/nav.html" %>
		</div>
		
		 <div class="row container-fluid" style=" margin-top: -5px">
        <div class="col-md-3 col-lg-3">
        <%@ include file="../includes/sidebar.jsp" %>
        </div>
        <div class="col-md-9 col-lg-9">
        <%@ include file="../carousel.jsp" %>
        </div>
      </div>
		
		</div>
	
		<script type="text/javascript" src="../resources/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>

	<div class="footor container col-lg-12 col-md-8 col-sm-12 col-xs-12">
		
		<p class="text-info well well-sm ">This system is developed by volunteer
			students graduated from Adama science and Technology University for
			Oromiya Development Association</p>

		<%
 }
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
