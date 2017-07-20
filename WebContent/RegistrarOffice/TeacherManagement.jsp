<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Management</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
</head>
<body>


	<div class="row">
		<%@include file="../includes/vector.jsp"%>

		<div style="margin-top: -20px">
			<%@ include file="../includes/nav.html"%>
		</div>
	</div>
	<div class="container-fluid">
		<div class="container-fluid" style="margin-left: 2px">
			<div class=" col-lg-3 col-md-4 col-xs-12 col-sm-12">
				<%@ include file="../includes/sidebar.jsp"%>
			</div>
			<div class="col-lg-5 col-md-8 col-xs-12 col-sm-12 ">
				<%@ include file="ResignTeacher.jsp"%>
			</div>

			<div class="col-lg-4 col-md-8 col-xs-12 col-sm-12 pull-right">
				<div class="panel panel-heading ">
					<strong> Teacher re-hiring form</strong>
				</div>

				<form action="" method="post" class="form-inline pull-right">
					<div class="form-group">

						<div class="col-lg-6">
							<input type="text" name="teacherid" class="form-control"
								placeholder="Enter Teacher ID">

						</div>
						<div class="col-lg-6">
							<input type="submit" value="search" class="btn btn-primary">
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>

	<div class=" container-fluid ">
		<%
	
	
	
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY");
			SimpleDateFormat lsdf = new SimpleDateFormat("MMMM");

			String year = sdf.format(date);
			String month = lsdf.format(date);
			
		%>
		<p class="text-info  well well-sm">
			This system is developed by volunteer students graduated from Adama
			science and Technology University for Oromiya Development Association
			<% 
			out.println("<center>" + "&copy" + " " + month + " " + year +  "</center");
			%>
		</p>


	</div>

</body>
</html>