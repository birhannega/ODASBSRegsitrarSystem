
<%
	if (session.getAttribute("user") == null) 
	{
		response.sendRedirect("../index.jsp");
	}
	else
	{
		String ActiveUSer=session.getAttribute("user").toString();
		
		
%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="databaseConnection.Dbconnection"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit mark</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/print.css" media="print">

<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
</head>
<body>
	<div class="container-fluid">
		<div class="panel panel-default" style="border: 0">
			<div class="panel-heading">
				<strong>ODA Special Boarding School Students mark Editing
					Form </strong>
			</div>
			<div class="panel-body">

				<%
				Dbconnection dbconnection = new Dbconnection();
				Statement home_statement=dbconnection.getConnection().createStatement();
				ResultSet rSet=home_statement.executeQuery("select Grade,Section_ID from TBL_homeroom where TeacherId=(select TeacherId from TBL_Users where userName='"+ActiveUSer+"')");
				if(rSet.next())
				{
					
					String rome_Grade=rSet.getString(1),Section=rSet.getString(2);
					out.print(rome_Grade);
			     %>
				<form action="" method="post" class="form-inline pull-right"
					id="transcript" autocomplete="off">
					<div class="form-group">
						<label>Student ID</label> <input class="form-control"
							name="studentID" value="ODASBS/"> <label>Select
							Semister</label> <select class="form-control" name="semister">
							<option value="">choose semister</option>
							<option>I</option>
							<option>II</option>
						</select>
						<button type="submit" class="btn btn-primary ">
							<span class="fa fa-arrow-right"> Go! </span>
						</button>
					</div>

				</form>
			</div>
		</div>
		<%
		Date date=new Date();
		SimpleDateFormat  dateFormat=new SimpleDateFormat("Y");
		String year=dateFormat.format(date);
		
		
			String stud_id = request.getParameter("studentID");
		String semister = request.getParameter("semister");
				if (stud_id != null) {
					
					

					/* int Grade = 0; String section = null, _Semister = null;
					Statement editStatement = dbconnection.getConnection().createStatement();
					ResultSet resultSet = editStatement.executeQuery(
							"select * from TBL_total_mark where Stud_id='" + stud_id + "' and Grade='"+rome_Grade+"' and Section_id='"+Section+"'");
					if (resultSet.next()) {
						Grade = resultSet.getInt("Grade");
						section = resultSet.getString("Section_id");
						
					} */
					int i=1;
				
					Statement editstatement = dbconnection.getConnection().createStatement();
					ResultSet resultSet_su = editstatement
							.executeQuery("select Subject_id,Total from TBL_mark where Grade='" + rome_Grade + "' and semister='"+semister+"' and Stud_id='"+stud_id+"' order by Subject_id");
					%>
		<form class="form-group" method="post">


			<%
					while(resultSet_su.next())
					{
						String subject=resultSet_su.getString("Subject_id");
				
						String name="sub"+i;
						%>
			<div class="form-group col-lg-4 col-md-4">
				<label class="label-control" for="sub"><%=subject%></label> <input
					class="form-control" name="<%=name%>"
					value="<%=resultSet_su.getString("total")%>">
			</div>

			<%
						i++;
					}
					%>
			<button type="submit" class="btn btn-primary pull-right">Save
				Edited Mark</button>


		</form>
		<%
		
			}
					else
					{
					%>

		<div class="container">


			<div class="alert alert-warning ">please enter correct student
				ID</div>

		</div>
		<%
					}
	}
		%>

	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#transcript").validate({

				rules : {
					studentID : "required",
					studentID : {
						required : true,
						minlength : 16,
						maxlength : 16,
						autocomplete : false,
					}
				}
			});
		});
	</script>

	<script type="text/javascript"
		src="../resources/jquery/jquery-1.11.1.js"></script>
	<script type="text/javascript"
		src="../resources/jquery/jquery.validate.js"></script>
</body>
<%
	}
%>
</html>