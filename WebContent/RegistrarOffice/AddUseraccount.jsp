
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
<meta charset="ISO-8859-1">
<title>Add User</title>
<meta name="viewport" content="width=device-width, initial-scale=1">



</head>

<body>
	<div class="container-fluid">
		<div>
			<%@include file="../includes/vector.jsp"%>
		</div>
		<div class="container-fluid">
			<div class="row"
				style="margin-top: -20px; margin-right: -15px; margin-left: -15px">
				<%@ include file="../includes/nav.html"%>
			</div>

			<span class="col-lg-3 col-sm-12 col-md-3"
				style="margin-right: -20px;"> <%@ include
					file="../includes/sidebar.jsp"%>
			</span> <span class=" col-sm-12 col-lg-9 col-md-9"> <%@ include
					file="AddUser.jsp"%>
			</span>

		</div>
	</div>
	<div class="   col-lg-12 col-md-8 col-sm-12 col-xs-12">

		<p class="text-info well well-sm ">This system is developed by
			volunteer students graduated from Adama science and Technology
			University for Oromiya Development Association</p>

		<%
Date date=new Date(); 
SimpleDateFormat sdf=new SimpleDateFormat("YYYY");
		SimpleDateFormat lsdf=new SimpleDateFormat("MMMM");

String year=sdf.format(date);
String month=lsdf.format(date);
out.println("<center>"+"<h5>"+"&copy"+" "+month+" "+year+"</h5>"+"</center");
 }
%>

	</div>

</body>
</html>
