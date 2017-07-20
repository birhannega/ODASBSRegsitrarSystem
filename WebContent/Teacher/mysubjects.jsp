<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.*,java.text.*"%>

<%  
 if(session.getAttribute("user")==null)
 {
   response.sendRedirect("../index.jsp");
 }
 else
 {
 %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Teachers-page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>


<style type="text/css">
body {
	font-family: "Trebuchet MS", sans-serif;
}
</style>

</head>

<body>
	<div class="container-fluid">
		<%@ include file="../includes/vector.jsp"%>
		<div class="container-fluid">
			<div class="col-lg-3 col-sm-12 col-md-3"
				style="margin-right: -12px; margin-left: -12px">
				<%@include file="../includes/Tsidebar.jsp"%>
			</div>


			<div class="col-lg-9 col-sm-12 col-md-9" style="margin-left: -2px;">
				<%@ include file="mysubject.jsp"%>
			</div>
			<%-- <div class="col-lg-3 col-md-4" style="margin-left:-15px; margin-right:2px">
                 <%@ include file="Viewprofile.jsp"  %>
        </div> --%>
		</div>
	</div>

	<div class="footor container col-lg-12 col-md-8 col-sm-12 col-xs-12">
		<hr style="border: 1px solid brown">
		<p class="text-info">This system is developed by volunteer
			students graduated from Adama science and Technology University for
			Oromiya Development Association</p>

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
