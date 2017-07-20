<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="databaseConnection.*"%>

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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />

<script type="text/javascript"
	src="../resources/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- Modal -->
	<div class="container-fluid">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>



						<h3 style="font: bold italic 22px solid font-awesome">
							<span class="  glyphicon glyphicon-edit" style="color: red"></span>New
							Evaluation (Custom Test)

						</h3>

					</div>
					<div class="modal-body">


						<form action="">
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon" id="sizing-addon2">Test
										Name</span> <input type="text" class="form-control"
										placeholder="Example: Assignment, test etc"
										aria-describedby="sizing-addon2">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon" id="sizing-addon2"> <span
										class="fa fa-percentile">Mark in %</span></span> <input type="text"
										class="form-control" placeholder="mass of test %100"
										aria-describedby="sizing-addon2">
								</div>
							</div>
						</form>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save Test</button>
					</div>
				</div>
			</div>
		</div>




		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="pull-left"><strong>student mark update
						form</strong></span> &nbsp; &nbsp; &nbsp; <span class="form-group fa fa-1x ">
					<button type="button" class="btn btn-default "
						Style="margin-right: 2px;" data-toggle="modal"
						data-target="#myModal">Add new Test criteria</button>
				</span>
			</div>
			<div class="panel-body">
				<!-- Button trigger modal -->




				<div class="form-group">

					<form class="form-horizontal" method="post" action="">


						<%
      String teacherID=null,grade=null,section=null;
      Dbconnection dbcon=new Dbconnection();
      Connection connection=dbcon.getConnection();
      String teacherid=session.getAttribute("user").toString();
      
      Statement stcheck=connection.createStatement();
  
      ResultSet rs_check=stcheck.executeQuery("select Subject_ID,Grade from TBL_Subject_Teacher where TeacherId=(select TeacherId from TBl_Users where userName='"+teacherid+"')");
      %>
						<div class="form-group col-lg-5">
							<div class="input-group ">
								<div class="input-group-addon">Grade</div>
								<select class="form-control " name="optgrade"
									required="required">
									<option value="null">Choose Grade</option>
									<%
      while(rs_check.next())
       {
      	grade=rs_check.getString(2);
      
      %>

									<option><%=grade %></option>
									<%} %>
								</select>



							</div>
						</div>
						&nbsp; &nbsp;
						<button type="submit" class="btn btn-primary">open form</button>
					</form>
				</div>

			</div>
			<div class="panel-footer"></div>
		</div>
	</div>





</body>
<%} %>
</html>