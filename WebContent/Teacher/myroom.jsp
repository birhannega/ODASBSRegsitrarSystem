<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
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
<html>
<head>
<meta charset="utf-8">
<title>Teachers-page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
#body{
font-family: "Trebuchet MS", sans-serif;
	
}
</style>
</head>

<body id="body">
	<div class="container-fluid">
		<div class="panel panel-primary">
			<div class="panel-heading">

				<h3 class="text-left">OLMA special boarding school student Record
					Management System</h3>

			</div>
		</div>

		<div class="col-lg-3 col-sm-4 col-md-4">
			

				<%@ include file="../includes/Tsidebar.jsp" %>
			</div>
		

		<div class="col-lg-9 col-sm-8 col-md-8" style="margin-left:-20px">

			
				
					<%@ include file="hrmtabs2.jsp" %>
			



			



		</div>
	</div>
	<div class="footor container col-lg-12 col-md-8 col-sm-12 col-xs-12">
		<hr style="border: 1px solid brown">
		<p class="text-info">This system is developed by volunteer
			students graduated from Adama science and Technology University for
			Oromiya Development Association</p>

	

	</div>
<%} %>
</body>
</html>
