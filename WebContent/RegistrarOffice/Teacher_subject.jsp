
<%
if(session.getAttribute("registrar")==null)
{
	response.sendRedirect("../index.jsp");
	}
else
{
	Dbconnection dbcon = new Dbconnection();
	String branch=null;
	Statement dbStatement=dbcon.getConnection().createStatement();
	ResultSet dbresultSet=dbStatement.executeQuery("select branch from TBL_Users where userName='"+session.getAttribute("registrar").toString()+"'");
if(dbresultSet.next())
{
	branch=dbresultSet.getString(1);
}
else
{
out.print("Branch Detection Failed");	
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="databaseConnection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subject Teacher Assignment</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../bootstrap/font-awesome/css/font-awesome.min.css" />
</head>
<body>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-heading">
				<strong>Subject Teacher Assignment form</strong>
			</div>
			<div class="panel-body">
				<form class="form-inline " action="" method="post">



					<div class="form-group">
						<label for="subject">Choose subject</label> <select
							class="form-control" name="subject">

							<%
										
										Statement statement = dbcon.getConnection().createStatement();
										ResultSet rs_sub = statement.executeQuery("select  Distinct Name from TBL_SUBJ ");
										while (rs_sub.next()) {
											String subject = rs_sub.getString(1);
									%>
							<option value="<%=subject%>"><%= rs_sub.getString(1)%></option>
							<%
										}
									%>

						</select>
					</div>

					<button type="submit" class="btn btn-default">Choose
						Subject</button>
				</form>

				<%
String subject=request.getParameter("subject");
if(subject==null)
{
	%>
				<div class="container-fluid">
					<strong>No subject selected</strong>
				</div>

				<%
}
else
{
%>
				<div class="container-fluid">

					<form
						action="${pageContext.request.contextPath}/Subject_teacher_Assignment"
						method="post" class="form-group">
						<div>
							<hr>
						</div>
						<span class="text-block text-right text-success"> <strong>
								${overlimit} ${alreadyassigned} ${assigned} ${notassigned} </strong>
						</span>
						<%
request.getSession().setAttribute("address", null);
request.getSession().setAttribute("overlimit", null);
request.getSession().setAttribute("alreadyassigned", null);
request.getSession().setAttribute("assigned", null);
request.getSession().setAttribute("notassigned", null);
%>

						<div class="form-group col-lg-4 col-md-4">
							<strong> select Teacher ID</strong> <select name="Teacherid"
								class="form-control" required="required">
								<option value="">select TeacherID</option>
								<%
	Statement list_Teacher=dbcon.getConnection().createStatement();
	ResultSet res_list_teacher=list_Teacher.executeQuery("Select TeacherId from TBL_teacher where Qualified='"+subject+"' and Status='Active'");
	while(res_list_teacher.next())
	{
		%>
								<option><%=res_list_teacher.getString(1) %></option>
								<%
	}
	%>
							</select>
						</div>
						<div class="form-group col-lg-4 col-md-4">
							<strong>Choose Grade</strong> <select name="grade"
								class="form-control" required="required">
								<option value="">Choose Grade</option>
								<%
										for (int i = 9; i <= 12; i++) {
									%>
								<option><%=i%></option>
								<%
									}
									%>
							</select>
						</div>
						<div class="form-group col-lg-4 col-md-4">

							<strong>choose Section</strong> <select name="section"
								required="required" class="form-control">
								<option value="">Choose section</option>
								<option>A</option>
								<option>B</option>
							</select>
						</div>

						<div class="form-group ">
							<input type="hidden" name="branch" value="<%=branch%>"> <input
								type="hidden" name="subject" value="<%=subject%>">
							<button class="btn  pull-right">save Assignment</button>
						</div>

					</form>
				</div>
				<%
	}
}
%>
			</div>
		</div>
	</div>
</body>
</html>