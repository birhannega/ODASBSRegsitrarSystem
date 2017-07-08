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

<title>Enrollments </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />

</head>

<body>
	<div class="container-fluid" >
		<div class="row">
			<%@ include file="../includes/vector.jsp" %>
			</div>
			<div  style="margin: -20px -25px -2px -30px ">
			<%@ include file="../includes/nav.html" %>
			</div>
		
		<div class="col-lg-3 col-sm-12 col-md-3">
				<%@ include file="../includes/sidebar.jsp" %>
			</div>
			
			<!-- //////////////////
			
			choose form
			
			////////////////////// -->
			<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 clearfix">
	<!-- 		<div class="form-group">
		<form class="form-inline pull-right" action="" method="post">
  <div class="form-group">

   
      
      <select  class="form-control" name="action" required="required">
      <option value="">--------choose action-------</option>
      <option value="Ts">Teacher to Subject Assignment</option>
      <option value="hrm">Home room teacher Assignment</option>
      </select>
     
    
  </div>
  <button type="submit" class="btn btn-primary">choose Action</button>
</form>
</div> -->
</div>
			<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
		<%-- 	<%
			String action=request.getParameter("action");
			if(action==null||action.trim()=="")
			{
				out.print("no action selected");
			}
			else if(action.equalsIgnoreCase("Ts"))
			{
				%>
				<%@include file="Teacher_subject.jsp" %>
				<%
			}
			else  if(action.equalsIgnoreCase("hrm"))
			{
			%> --%>
					<%@include file="Teacher_subject.jsp" %>	
			
			</div>
			
		
			
	
	</div>
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
out.println("<center>"+"<h5>"+"&copy"+" "+month+" "+year+"</h5>"+"</center");

%>

	</div>

</body>
</html>
