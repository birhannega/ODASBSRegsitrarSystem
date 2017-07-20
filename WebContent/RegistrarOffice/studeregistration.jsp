
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
<style type="text/css">
.error{
color:red
}
</style>
<title>student-registration</title>
<link rel="icon" href="resources/images/Sorting icons.psd">
<meta name="viewport" content="width=device-width, initial-scale=1">


</head>

<body>

	<div class="container-fluid">
		<div style="margin-left: -10px">
			<%@include file="../includes/vector.jsp"%>
		</div>
		<div class="container-fluid"
			style="margin-top: -15px; margin-left: -25px;">
			<%@ include file="../includes/nav.html"%>
		</div>

		<div class="col-lg-3 col-sm-4 col-md-3">
			<%@ include file="../includes/sidebar.jsp"%>
		</div>

		<div class="col-sm-8 col-md-9 col-lg-9 pull-right"
			style="margin-left: -30px">

			<form role="form" class="form-inline pull-right" method="get"
				action="">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon">choose Grade</span> <select
							class="form-control" name="grade" required="required"
							autofocus="autofocus">
							<option value="">choose Grade</option>
							<option>9</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
						</select>
					</div>
				</div>
				<div class="form-group">

					<input type="submit" value="GO!" class="btn btn-primary" />
				</div>
			</form>
		</div>
		<div class="col-sm-8 col-md-9 col-lg-9 pull-right"
			style="margin-top: 10px">
			<%
			String choosenGrade=request.getParameter("grade");
			if(choosenGrade==""||choosenGrade==null)
			{
				%>
			<div class="container-fluid">
				<%@ include file="StudentRegistration.jsp"%></div>
			<%
				}
			else if(choosenGrade.equals("9"))
			{
				%>
			<%@ include file="StudentRegistration.jsp"%>
			<%
			}
			else if(choosenGrade.equals("10"))
			{
			%>
			<%@ include file="GradeTenReg.jsp"%>
			<%
			}
			else if(choosenGrade.equals("11"))
			{
				%>
			<%@ include file="GradeElevenReg.jsp"%>
			<%
			}
			else if(choosenGrade.equals("12"))
			{
				%>
			<%@ include file="GradeTweReg.jsp"%>
			<%
			}
			else
			{
				%>
			<h4>Grade not specified</h4>
			<%
			}
			%>






		</div>

		<script src="../external/jquery/jquery.js"></script>
		<script src="jquery-ui.js"></script>
<script type="text/javascript"
	src="../resources/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript"
	src="../resources/jquery/jquery.validate.js"></script>


		<div class="footor container col-lg-12 col-md-8 col-sm-12 col-xs-12">

			<p class="text-info well well-sm ">This system is developed by
				volunteer students graduated from Adama science and Technology
				University for Oromiya Development Association</p>

			<%}
Date date=new Date(); 
SimpleDateFormat sdf=new SimpleDateFormat("YYYY");
		SimpleDateFormat lsdf=new SimpleDateFormat("MMMM");

String year=sdf.format(date);
String month=lsdf.format(date);
out.println("<center>"+"<h5>"+"&copy"+" "+month+" "+year+"</h5>"+"</center");

%>

		</div>
	</div>
</body>
</html>
