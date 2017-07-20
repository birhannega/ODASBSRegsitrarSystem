<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.css" />


<title>Central Admin page</title>
</head>
<body>
	<div class="row">
		<%@include file="../includes/vector.jsp"%>
	</div>
	<nav class="navbar navbar navbar-default " style="margin-top: -20px">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><strong><span
						class="text-info">ODASBS</span></strong></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Students center <span
							class="sr-only">(current)</span></a></li>
					<li><a href="#">User Accounts</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Teachers center <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Active Teachers</a></li>
							<li><a href="#">Teacher profile</a></li>
							<li><a href="#">Resigned Teachers</a></li>

						</ul></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Academics</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">My Account <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Change Password</a></li>
							<li><a href="#">My Profile</a></li>

							<li role="separator" class="divider"></li>
							<li><a href="#">Logout</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="container">


		<div class=" col-lg-3 col-sm-12 col-xs-12 pull-right">
			<div class="panel panel-primary">
			
				<div class="panel-heading"> <strong>ODASBS This Year</strong></div>
				<ol class="list-group  ">

 	
					<li class="list-group-item">3 Branches</li>
					<li class="list-group-item">
                       

 Students</li>
					<li class="list-group-item">56 Teachers</li>
					<li class="list-group-item">3 Branches</li>
					<li class="list-group-item">230 Students</li>
					<li class="list-group-item">56 Teachers</li>

				</ol>
			</div>
		</div>

		<div class="list-group col-lg-8 pull-left">
			<p class="text-info text-uppercase">
				<strong>welcome to central administrator panel</strong>
			</p>
			<p>Now you have the highest privilege to decide on this system</p>
			<ul class="list-group">

				<li class="list-group-item ">Viewing reports of all branches</li>

				<li class="list-group-item"><span class="text-info">
						Activating and Closing Academic Year</span></li>
				<li class="list-group-item  ">Adding Branches</li>
			</ul>




		</div>


	</div>


	<footer class=" container well well-sm footer sticky-footer">
		<%
			Date date = new Date();
			out.println(date);
		%>

	</footer>
	<script type="text/javascript"
		src="../resources/js/jquery-1.10.2.min.js"></script>

	<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>
</body>
</html>