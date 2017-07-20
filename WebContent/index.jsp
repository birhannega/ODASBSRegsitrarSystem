
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="bootstrap/font-awesome/css/font-awesome.min.css" />


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login panel</title>



<style>
body {
	font-family: "Trebuchet MS", sans-serif;
	padding-top: 4px;
	padding-bottom: 40px;
}

.error {
	color: red;
}
</style>
</head>
<body>

	<div class="container-fluid">

		<div>
			<%@include file="includes/vector.jsp"%>
		</div>
	</div>
	<div class="container-fluid">
		<div class=" col-xs-offset-2 col-md-6 col-lg-offset-2 pull-left "
			style="margin-top: 5px">
			<div class="row">
				<div class="panel panel-default ">
					<div class="alert-success panel-heading  text-center">
						<h5 class="text-info">
							<strong>Administrator Login Panel</strong>
						</h5>

					</div>

					<div class="panel-body">
						<div class="panel-content">

							<form
								action="${pageContext.request.contextPath}/LoginAuthenicate"
								method="post" id="loginform" class="form-group col-lg-10">

								<h4 style="color: red" style="color:red">${error}</h4>




								<div class="form-group col-lg-offset-2">
									<div class="input-group">
										<span class="input-group-addon "> <span
											class="fa fa-user fa-lg"> </span></span> <input
											title="Enter your User name" class="form-control" type="text"
											id="user" name="user" placeholder="Enter your user name">
									</div>
								</div>

								<div class="form-group  col-lg-offset-2">
									<div class="input-group">
										<span class="input-group-addon "><span
											class="fa fa-key fa-lg pull-right"> </span></span> <input
											class="form-control" type="password" name="password"
											id="password" placeholder="enter your password"
											title="enter your password">

									</div>

								</div>
								<div class="form-group pagination-centered pull-right">
									<div class="input-group">
										<button data-placement="left"
											title="Click Here to reset Input" id="reset" name="Login"
											style="margin-right: 6px;" class="btn btn-danger pull-left "
											type="reset">
											<i class="fa fa-trash"></i> Reset input
										</button>

										<button data-toggle="tooltip" title="This is Sign In button"
											id="signin" name="Login" class="btn  btn-primary pull-right"
											type="submit">
											<i class=" fa fa-sign-in"></i> Sign in
										</button>
									</div>


								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class=" container">

		<p class="text-info well well-sm ">This system is developed by
			volunteer students graduated from Adama science and Technology
			University for Oromiya Development Association</p>

		<%
 
Date date=new Date(); 
SimpleDateFormat sdf=new SimpleDateFormat("YYYY");
		SimpleDateFormat lsdf=new SimpleDateFormat("MMMM");

String year=sdf.format(date);
String month=lsdf.format(date);
out.println("<center>"+"<h5>"+"&copy ODASBS"+" "+month+" "+year+"</h5>"+"</center");

%>

	</div>
	<script type="text/javascript" src="resources/jquery/jquery-1.11.1.js"></script>
	<script type="text/javascript"
		src="resources/jquery/jquery.validate.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#loginform")
									.validate(
											{
												rules : {
													type : "required",
													branch : "required",

													password : "required",
													user : {
														required : true,
														minlength : 4
													}
												},
												messages : {
													user : {
														required : "please enter your username",
														minlength : "user name should be atleast 4 characters long"
													}
												}

											})

						});
	</script>

</body>
</html>